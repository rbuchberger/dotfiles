#!/usr/bin/env bash

input=$(cat)

# Tab counts as IFS whitespace, so consecutive tabs would collapse and shift
# every field left when a value is empty. Use a non-whitespace separator.
IFS=$'\x1f' read -r name id dir used size effort < <(
  echo "$input" | jq -j '
    [ .model.display_name // "",
      .model.id // "",
      .workspace.current_dir // .cwd // "",
      .context_window.total_input_tokens // 0,
      .context_window.context_window_size // 0,
      .effort.level // ""
    ] | join("")'
)

# display_name is bare ("Opus"), so recover the version from the model id
# ("claude-opus-4-8" -> "4.8"). Trailing date suffixes are dropped.
label="$name"
if [[ -n "$id" && ! "$label" =~ [0-9] ]]; then
  version="${id#claude-}"
  version="${version%-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]}"
  version="${version#*-}"
  version="${version//-/.}"
  [[ "$version" =~ ^[0-9.]+$ ]] && label="$label $version"
fi
[[ -n "$effort" ]] && label="$label ($effort)"

tokens() {
  local n=$1
  (( n >= 1000000 )) && printf '%dM' $(( (n + 500000) / 1000000 )) && return
  printf '%dk' $(( (n + 500) / 1000 ))
}

context="$(tokens "$used")/$(tokens "$size")"

color=$'\033[0m'
(( used >= 100000 )) && color=$'\033[33m'
(( used >= 150000 )) && color=$'\033[31m'

# Git segment, styled after the shell's Starship prompt (dimmed branch,
# cyan dirty marker). Skip optional locks so this never blocks on a
# concurrent git process.
branch=""
dirty=""
if git -C "$dir" --no-optional-locks rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null)
  git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null | grep -q . && dirty=1
fi

git_segment=""
if [[ -n "$branch" ]]; then
  git_segment="  \033[2m${branch}\033[0m"
  [[ -n "$dirty" ]] && git_segment="${git_segment} \033[36m*\033[0m"
fi

printf '%s  \033[34m%s\033[0m%b  %s%s\033[0m  \033[34m❯\033[0m' \
  "$label" "${dir/#$HOME/\~}" "$git_segment" "$color" "$context"

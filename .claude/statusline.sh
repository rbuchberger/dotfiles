#!/usr/bin/env bash

input=$(cat)

IFS=$'\t' read -r name id dir used size < <(
  echo "$input" | jq -r '
    [ .model.display_name // "",
      .model.id // "",
      .workspace.current_dir // .cwd // "",
      .context_window.total_input_tokens // 0,
      .context_window.context_window_size // 0
    ] | @tsv'
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

tokens() {
  local n=$1
  (( n >= 1000000 )) && printf '%dM' $(( (n + 500000) / 1000000 )) && return
  printf '%dk' $(( (n + 500) / 1000 ))
}

context="$(tokens "$used")/$(tokens "$size")"

color=$'\033[0m'
(( used >= 100000 )) && color=$'\033[33m'
(( used >= 150000 )) && color=$'\033[31m'

printf '%s  \033[34m%s\033[0m  %s%s\033[0m' \
  "$label" "${dir/#$HOME/\~}" "$color" "$context"

# Set vim style
bindkey -v

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

WORDCHARS=${WORDCHARS//[\/]}
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Initialize zim

# Define zim location
export ZIM_HOME=~/.config/zim/
if [[ ~/.config/zim/init.zsh -ot ~/.zimrc ]]; then
  source ~/.config/zim/zimfw.zsh init -q
fi

source ~/.config/zim/init.zsh

# Load everything in ~/.config/zsh/
for file in ~/.config/zsh/source/*; do
  source $file
done

# Prompt (pure)
# The default prompt symbols don't work well in TTY
PURE_PROMPT_SYMBOL=">"
PURE_PROMPT_VICMD_SYMBOL="<"
# Don't check for untracked files; faster prompt.
PURE_GIT_UNTRACKED_DIRTY=0
PURE_CMD_MAX_EXEC_TIME=1

fpath+=$HOME/.config/zsh/pure
autoload -U promptinit; promptinit
prompt pure

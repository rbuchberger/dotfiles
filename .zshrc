# Load everything in ~/.config/zsh/
for file in ~/.config/zsh/source/*; do
  source $file
done

# Set vim style
bindkey -v

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

WORDCHARS=${WORDCHARS//[\/]}
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Initialize zim
if [[ ${ZIM_HOME}/init.zsh -ot ~/.config/zsh/zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

source ${ZIM_HOME}/init.zsh

bindkey -s '^O' 'ranger-cd\n'

# ZSH specific keys have to come after zsh is initialized
# zsh-history-substring-search

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

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

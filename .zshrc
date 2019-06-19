# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Aliases
alias icat="kitty +kitten icat"
alias cat="bat"
alias be="bundle exec"

alias m="neomutt"
alias n="newsboat"
alias p="podboat"
alias c="ikhal"

alias t="task"
alias ta="task add"
alias td="task done"
alias tm="task mod"

# Clone repo in the clipboard
alias gcy="xsel -ob | xargs git clone"

# Path to your oh-my-zsh installation.
export ZSH="/home/robert/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


export PATH=/usr/bin:/home/robert/.rbenv/bin:$PATH
export PATH=/home/robert/.config/composer/vendor/bin:$PATH
export PATH=/home/robert/scripts:$PATH


eval "$(rbenv init -)"
source /usr/share/nvm/init-nvm.sh

# Ranger load only my config:
export RANGER_LOAD_DEFAULT_RC=FALSE

# GPG key setting for package builds
export GPGKEY=8C29272B84A3CC1BD7CBBCF218B7E45B74319F2C

# Vim mode
bindkey -v

# Fuzzyvim bound to ctrl+p
_fuzzyvim() {
  ~/scripts/fuzzyvim
}

zle -N _fuzzyvim

bindkey "^P" _fuzzyvim

# Show notes bound to ctrl+n

_note_show() {
  ~/scripts/note_show
}

zle -N _note_show

bindkey "^N" _note_show

# Delay by .2 seconds; reduce insert & normal mode switching lag
export KEYTIMEOUT=2

# Disable auto correct
unsetopt correct_all

# Powerline config
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme # Load the plugin

POWERLEVEL9K_PROMPT_ON_NEWLINE=true # 2 line prompt
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true # Add new line before prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir vcs vi_mode )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
POWERLEVEL9K_VI_INSERT_MODE_STRING=""
POWERLEVEL9K_VI_COMMAND_MODE_STRING="Normal Mode"
# POWERLEVEL9K_MODE='awesome-patched'

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/robert/.netlify/helper/path.zsh.inc' ]; then source '/home/robert/.netlify/helper/path.zsh.inc'; fi
[ -f /home/robert/.config/cani/completions/_cani.zsh ] && source /home/robert/.config/cani/completions/_cani.zsh

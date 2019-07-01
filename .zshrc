# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Aliases
alias icat="kitty +kitten icat"
alias cat="bat"
alias be="bundle exec"
alias bejs="bundle exec jekyll serve --livereload"

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

export EDITOR='nvim'
export BROWSER='qutebrowser'

# Delay by .2 seconds; reduce insert & normal mode switching lag
export KEYTIMEOUT=2

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

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/robert/.netlify/helper/path.zsh.inc' ]; then source '/home/robert/.netlify/helper/path.zsh.inc'; fi

# Rehash completion when pacman installs or updates packages. Note that this
# requires a hook file in /etc/pacman.d/hooks/, see the arch wiki:

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

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

export MANWIDTH=80

# Delay by .2 seconds; reduce insert & normal mode switching lag
export KEYTIMEOUT=2

# export PATH=/usr/bin:/home/robert/.rbenv/bin:$PATH
# export PATH=/home/robert/.config/composer/vendor/bin:$PATH
# export PATH=/home/robert/scripts:$PATH

eval "$(rbenv init -)"

source /usr/share/nvm/init-nvm.sh

# Ranger load only my config:
# export RANGER_LOAD_DEFAULT_RC=FALSE

# GPG key setting for package builds
# export GPGKEY=8C29272B84A3CC1BD7CBBCF218B7E45B74319F2C

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

# Open a markdown file with today's date as a name.
function today() {
  nvim $(date -I).md
}

# Download aur packages which are out of date:
function aur_fetch_updates() {
  aur fetch $(aur repo -al | aur vercmp -q)
}

# Chack for packages which are in the custom repo, but which aren't installed on
# the local system.
function aur_check {
  # list packages in aur repo
  aur repo -l | cut -f 1 | sort > /tmp/aurlist
  # list packages in pacman repo
  pacman -Q | cut -d ' ' -f 1 | sort > /tmp/paclist

  diff --new-line-format="" --unchanged-line-format="" /tmp/aurlist /tmp/paclist

  rm /tmp/aurlist /tmp/paclist
}

# Remove packages from custom repo
function aur_remove {
  repo-remove $(aur repo).tar $@
}

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

zle -N _note_show

bindkey "^N" _note_show

# Edit commands in vim

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Ranger cd

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

bindkey -s '^O' 'ranger-cd\n'

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/robert/.netlify/helper/path.zsh.inc' ]; then source '/home/robert/.netlify/helper/path.zsh.inc'; fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
if [ -f '$HOME/.cargo/env' ]; then source '$HOME/.cargo/env'; fi

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
# source ~/.config/environment.d/environment.conf
if [ -f ~/.config/hunter/hunter_cd.sh ]
then
  source ~/.config/hunter/hunter_cd.sh
fi

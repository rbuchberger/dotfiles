# Rust
[ -f '$HOME/.cargo/env' ] && source '$HOME/.cargo/env'

# Rbenv
# [ -f $RBENV_ROOT/completions/rbenv.zsh ] && source $RBENV_ROOT/completions/rbenv.zsh
# eval "$(rbenv init -)"

# NVM
# source /usr/share/nvm/init-nvm.sh
# alias nvm_init="source /usr/share/nvm/init-nvm.sh"

export PATH=/home/robert/scripts:$PATH

# Hunter CD
[ -f ~/.config/hunter/hunter_cd.sh ] && source ~/.config/hunter/hunter_cd.sh

# asdf version manager
if [ -f /opt/asdf-vm/asdf.sh ]; then
  export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
  export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf

  source /opt/asdf-vm/asdf.sh

  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)

  # initialise completions with ZSH's compinit
  autoload -Uz compinit
  compinit
fi

# asdf managed direnv
[ -f /usr/bin/direnv ]                       \
  && [ $(asdf --version) ]                   \
  && [ $(asdf plugin list | grep 'direnv') ] \
  && eval "$(asdf exec direnv hook zsh)"

direnv() { asdf exec direnv "$@"; }

# FZF
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# Netlify's Git Credential Helper.
# if [ -f '/home/robert/.netlify/helper/path.zsh.inc' ]; then source '/home/robert/.netlify/helper/path.zsh.inc'; fi

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

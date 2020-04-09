# Rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export PATH="$HOME/.cargo/bin:$PATH"
[ -f '$HOME/.cargo/env' ] && source '$HOME/.cargo/env'

# Rbenv
# https://github.com/rbenv/rbenv
export RBENV_ROOT=$XDG_DATA_HOME/rbenv
export PATH=$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH
source $RBENV_ROOT/completions/rbenv.zsh
eval "$(rbenv init -)"

# NVM
source /usr/share/nvm/init-nvm.sh

export PATH=/home/robert/scripts:$PATH

# Hunter CD
[ -f ~/.config/hunter/hunter_cd.sh ] && source ~/.config/hunter/hunter_cd.sh

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

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

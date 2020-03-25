# Rust
export PATH="$HOME/.cargo/bin:$PATH"
[ -f '$HOME/.cargo/env' ] && source '$HOME/.cargo/env'

# Rbenv
export PATH=$XDG_DATA_HOME/rbenv/bin:$PATH
eval "$(rbenv init -)"

# NVM
source /usr/share/nvm/init-nvm.sh

export PATH=/home/robert/scripts:$PATH

# Hunter CD
[ -f ~/.config/hunter/hunter_cd.sh ] && source ~/.config/hunter/hunter_cd.sh

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

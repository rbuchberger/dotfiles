load-env {
  "GPGKEY": 8C29272B84A3CC1BD7CBBCF218B7E45B74319F2C,
  "GNUPGHOME": ([$env.XDG_DATA_HOME, gnupg] | path join),

  # FZF  setup
  "FZF_DEFAULT_COMMAND": "rg --ignore-file $env.XDG_CONFIG_HOME/git/gitignore-global --files",
  "FZF_CTRL_T_COMMAND": "$FZF_DEFAULT_COMMAND",
  "FZF_CTRL_T_OPTS": '--preview "bat --style=numbers --color=always {} | head -500"',
  "FZF_ALT_C_OPTS": "--preview 'tree -C {} | head -200'",
  "FZF_ALT_C_COMMAND": "fd --type d --ignore-file $env.XDG_CONFIG_HOME/git/gitignore-global",

  # Set up SSH agent
  "SSH_AUTH_SOCK": ([$env.XDG_RUNTIME_DIR, ssh-agent.socket] | path join),

  # Grim
  "GRIM_DEFAULT_DIR": ([$env.HOME, screenshots] | path join),

  "AWS_CONFIG_FILE": ([$env.XDG_CONFIG_HOME, aws/config] | path join),
  "AWS_SHARED_CREDENTIALS_FILE": ([$env.XDG_DATA_HOME, aws/credentials] | path join),

  "B2_ACCOUNT_INFO": ([$env.XDG_DATA_HOME, b2/b2_account_info] | path join),

  "BUNDLE_USER_CACHE": ([$env.XDG_CACHE_HOME, bundle] | path join) ,
  "BUNDLE_USER_CONFIG": ([$env.XDG_CONFIG_HOME, bundle] | path join) ,
  "BUNDLE_USER_PLUGIN": ([$env.XDG_DATA_HOME, bundle] | path join),

  "CARGO_HOME": ([$env.XDG_DATA_HOME, cargo] | path join),

  "HISTFILE": ([$env.XDG_DATA_HOME, zsh/history] | path join),
  "PASSWORD_STORE_DIR": ([$env.XDG_DATA_HOME, pass] | path join),
  "WEGORC": ([$env.XDG_CONFIG_HOME, wego/wegorc] | path join),
  "WINEPREFIX": ([$env.XDG_DATA_HOME, wineprefixes/default] | path join),

  "RUSTUP_HOME": ([$env.XDG_DATA_HOME, rustup] | path join),

  # Steam
  "STEAM_DIR": ([$env.HOME, games/SteamLibrary/] | path join),

  # So rails app:update works nicely
  "THOR_MERGE": "nvim -d",

  "BEMENU_OPTS": '--prefix 🙮🙮🙮 --list 20 --margin 800 --line-height 45 --fn "Iosevka Term SS05 Expanded 14" --tf="#da4939" --tb="#2b2b2b" --ff="#e6e1dc" --fb="5a647e" --nf="#e6e1dc" --nb="#2b2b2b" --hf="#a5c261" --hb="#5a647e" --sb="#5a647e" --sf="#a5c261"'
}

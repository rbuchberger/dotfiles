load-env {
  "XDG_CONFIG_HOME": ([$env.HOME, .config] | path join),
  "XDG_CACHE_HOME": ([$env.HOME, .cache] | path join),
  "XDG_DATA_HOME": ([$env.HOME, .local/share] | path join),

  "EDITOR": 'nvim',
  "DIFFPROG": 'nvim -d',
  "MANWIDTH": 80,

  "AUR_PAGER": ranger,
  "PAGER": nvimpager,

  "BROWSER": 'zen-bin',
}

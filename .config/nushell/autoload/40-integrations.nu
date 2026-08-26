$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu

# asdf
# $env.ASDF_DATA_DIR = '~/.asdf'
# path add $"($env.ASDF_DATA_DIR)/shims"
#
# # if ('~/.asdf/completions/nushell.nu' | path exists) {
# if ('/usr/bin/asdf' | path exists) {
#   const asdf_cmp = '~/.asdf/completions/nushell.nu'
#   asdf completion nushell | save -f $asdf_cmp
#
#   source $asdf_cmp
# }

# Direnv
# $env.config = ($env.config | upsert hooks {
#   env_change: {
#     PWD: [
#       {
#         condition: { || which direnv | is-not-empty }
#         code: { || direnv export json | from json | default {} | load-env }
#       }
#     ]
#   }
# })

# mise is activated in config.nu; autoload files don't propagate a module's env
# to the global scope. Regenerate mise.nu with:
#   mise activate nu | save -f ($nu.default-config-dir | path join mise.nu)

# yazi cd
def --env yazi-cd [...args] {
  let $tmpfile = mktemp
  yazi ...$args --cwd-file $tmpfile

  let target = open $tmpfile
  if ($target | is-empty) { return }

  cd $target
  rm $tmpfile
}

# fzf
def --env fuzzy-cd [] {
  let $dest = (fd --type d --ignore-file ~/.config/git/gitignore-global | fzf)
  if ($dest | is-empty) { return }

  cd $dest
}

$env.config.keybindings = [
  ...($env.config.keybindings? | default [])
  {
    name: 'yazi-cd'
    modifier: 'control'
    keycode: 'Char_y'
    mode: [vi_insert vi_normal]
    event: {
      send: executehostcommand
      cmd: yazi-cd
    }
  }

  {
    name: 'fuzzy-cd'
    modifier: 'alt'
    keycode: 'Char_c'
    mode: [vi_insert vi_normal]
    event: {
      send: executehostcommand
      cmd: fuzzy-cd
    }
  }
]

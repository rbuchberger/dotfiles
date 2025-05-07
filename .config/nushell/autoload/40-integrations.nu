$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu

# asdf
path add '~/.asdf/shims'
if ('~/.asdf/completions/nushell.nu' | path exists) {
  source ~/.asdf/completions/nushell.nu
}

# Direnv
$env.config = ($env.config | upsert hooks {
  env_change: {
    PWD: [
      {
        condition: { || which direnv | is-not-empty }
        code: { || direnv export json | from json | default {} | load-env }
      }
    ]
  }
})

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

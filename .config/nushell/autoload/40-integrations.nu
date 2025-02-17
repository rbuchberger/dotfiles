$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu

# asdf
path add '~/.asdf/shims'
if ('~/.asdf/completions/nushell.nu' | path exists) {
  source ~/.asdf/completions/nushell.nu
}

$env.config.hooks.env_change = $env.config.hooks.env_change | upsert PWD [
  ...($env.config.hooks.env_change.PWD? | default [])

  # Direnv
  { 
    condition: { which direnv | is-not-empty }
    code: { direnv export json | from json | default {} | load-env }
  }
]

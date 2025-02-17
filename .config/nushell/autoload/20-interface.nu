source ~/.config/nushell/themes/gruvbox-material-dark-medium.nu

# Starship (prompt)
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

load-env {
  "PROMPT_INDICATOR_VI_INSERT": ''
  "PROMPT_INDICATOR_VI_NORMAL": ''
}

$env.config.buffer_editor = "nvim"
$env.config.cursor_shape.vi_insert = 'line'
$env.config.cursor_shape.vi_normal = 'block'
$env.config.edit_mode = 'vi'
$env.config.show_banner = false
$env.config.table.header_on_separator = true

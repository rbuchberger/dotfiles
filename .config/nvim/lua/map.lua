-- Convenience function for mapping nvim keybindings
return function(mode, key, command, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end

  vim.keymap.set(mode, key, command, options)
end

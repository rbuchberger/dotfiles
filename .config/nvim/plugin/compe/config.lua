require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    treesitter = true;
    calc = true;
    ultisnips = true;
    emoji = true;
  };
}

vim.api.nvim_set_keymap('i', '<Tab>', "compe#confirm('<Tab>')", {
  silent = true,
  expr = true,
  noremap = true,
})

vim.api.nvim_set_keymap('i', '<C-Space>', "compe#complete()", {
  silent = true,
  expr = true,
  noremap = true,
})

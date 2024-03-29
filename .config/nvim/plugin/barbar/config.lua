require("if_installed")("barbar", function(barbar)
  local function nmap(binding, command)
    vim.api.nvim_set_keymap("n", binding, command, { noremap = true, silent = true })
  end

  nmap("<leader>x", ":BufferClose<CR>")
  -- nmap("<leader>d", ":BufferPick<CR>")
  -- nmap("<leader>bb", ":BufferOrderByBufferNumber<CR>")
  -- nmap("<leader>bd", ":BufferOrderByDirectory<CR>")
  -- nmap("<leader>bl", ":BufferOrderByLanguage<CR>")
  nmap("[b", ":BufferPrevious<CR>")
  nmap("]b", ":BufferNext<CR>")

  barbar.setup({
    -- Enable/disable animations
    animation = false,
    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = true,
    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = true,
    -- Enable/disable close button
    closable = true,
    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,
    -- Excludes buffers from the tabline
    exclude_ft = { qf },
    exclude_name = {},
    -- If true, new buffers will be inserted at the end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = false,
    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,
    -- Sets the maximum buffer name length.
    maximum_length = 45,
    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,
    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustement
    -- for other layouts.
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
    -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
    -- where X is the buffer number. But only a static string is accepted here.
    -- no_name_title = "          ",
  })
end)

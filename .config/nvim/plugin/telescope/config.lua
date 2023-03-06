require("if_installed")("telescope", function(telescope)
  telescope.setup({
    extensions = {
          ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          border = true,
        }),
      },
      heading = {
        treesitter = true,
      },
    },
  })

  telescope.load_extension("ui-select")
  telescope.load_extension("heading")
  telescope.load_extension("ultisnips")
  telescope.load_extension("undo")

  local builtin = require("telescope.builtin")
  local map = require("map")

  map("n", "<C-p>", builtin.find_files)
  map("n", "<leader>p", builtin.live_grep)
  map("n", "<M-p>", builtin.current_buffer_fuzzy_find)
  map("n", "<leader>b", builtin.buffers)
  map("n", "<C-g>", builtin.builtin)
  map("n", "<F1>", builtin.help_tags)
  map("n", "<M-z>", builtin.resume)
  map("n", "<M-t>", builtin.tagstack)
  map("n", "<leader>i", builtin.diagnostics)         -- mnemonic: issues
  map("n", "<leader>`", builtin.marks)
  map("n", "<leader>gc", builtin.lsp_document_symbols) -- mnemonic: code or constants
  map("n", "<leader>gt", builtin.treesitter) -- mnemonic: code or constants
  map("n", "<Leader>=", builtin.spell_suggest)
  -- map("n", "<F2>", builtin.keymaps)
  map("n", "<leader>;", builtin.commands)
  map("n", "<leader>'", builtin.registers)
  map("n", "<leader>gs", builtin.git_status)  -- mnemonic: git status
  map("n", "<leader>gh", builtin.git_bcommits) -- mnemonic: git history
  map("n", "<leader>gb", builtin.git_branches) -- mnemonic: git branch
  map("n", "gr", builtin.lsp_references) -- mnemonic: goto references
  map("n", "gd", builtin.lsp_definitions) -- mnemonic: goto definition
end)

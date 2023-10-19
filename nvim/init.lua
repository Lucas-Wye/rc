require('options')
require('keymaps')
require('plugins')
require('machine')
require('plugkeymaps')

---------------------------------------------------
-- nvim-tree
---------------------------------------------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true
-- setup
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  hijack_cursor = true,
--  open_on_setup = false,
--  open_on_setup_file = true,
--  ignore_buffer_on_setup = true,
  system_open = {
    cmd = "open",
  },
  view = {
    width = 5,
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        git = true,
        file = false,
        folder = false,
        folder_arrow = true,
      },
      glyphs = {
        bookmark = " ",
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})

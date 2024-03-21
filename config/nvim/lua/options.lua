-- File
vim.opt.filetype = 'plugin'
vim.opt.syntax = 'enable'

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.smarttab = true
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- use space
vim.opt.autoindent = true

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.cursorcolumn = true
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.mouse = ""
vim.opt.list = true -- show tab, space, etc.
vim.opt.listchars = 'tab:| ,trail:▫'
vim.opt.colorcolumn = '97'

-- Window
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Mode
vim.opt.ttyfast = true
vim.opt.autochdir = true
vim.opt.secure = false
vim.opt.scrolloff = 4
vim.opt.inccommand = 'split'
vim.opt.completeopt = 'longest,noinsert,menuone,noselect,preview'
vim.opt.visualbell = true

-- Fold
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

-- Go to previous line
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- Color
vim.opt.background = 'light'
-- vim.cmd('colorscheme zellner')

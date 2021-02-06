-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
vim.g.mapleader = " "

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<leader>l', '<C-w>l', opts)

-- 关闭所有buffer
-- vim.keymap.set('n', '<leader>bd', ':bufdo bd<CR>', opts)

-- disable 's'
vim.keymap.set('n', 's', '<nop>', opts)

-- split windows
vim.keymap.set('n', 'su', ':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>',  opts)
vim.keymap.set('n', 'sd', ':set splitbelow<CR>:split<CR>',                       opts)
vim.keymap.set('n', 'sl', ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>', opts)
vim.keymap.set('n', 'sr', ':set splitright<CR>:vsplit<CR>',                      opts)

-- show search count
vim.keymap.set('n', '<leader>n', ':lua print(vim.inspect(vim.fn.searchcount { maxcount = 0 }))<CR>', opts)

-- resize
-- vim.keymap.set('n', '<up>',    ':res +5<CR>',            opts)
-- vim.keymap.set('n', '<down>',  ':res -5<CR>',            opts)
-- vim.keymap.set('n', '<left>',  ':vertical resize-5<CR>', opts)
-- vim.keymap.set('n', '<right>', ':vertical resize+5<CR>', opts)

-- rotate windows
-- vim.keymap.set('n', 'srh', '<C-w>b<C-w>K', opts)
-- vim.keymap.set('n', 'srv', '<C-w>b<C-w>H', opts)

-- tab
-- vim.keymap.set('n', 'ts', ':tab split<CR>', opts)
-- `gt` and `gT` to go through each tab

-- quickfix
vim.keymap.set('n', '<leader>cn', ':cn<CR>', opts)
vim.keymap.set('n', '<leader>cp', ':cp<CR>', opts)
vim.keymap.set('n', '<leader>co', ':copen<CR>', opts)

-----------------
-- Visual mode --
-----------------
-- 搜索选中的内容
vim.keymap.set('v', '@', 'y/<c-r>"<cr>', opts)

-- 自动选中单词并搜索
-- use `*`

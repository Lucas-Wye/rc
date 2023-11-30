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

-- disable 's'
vim.keymap.set('n', 's', '<nop>', opts)

-- split windows
vim.keymap.set('n', 'sr',      ':vsplit<CR>:n<CR>', opts)
vim.keymap.set('n', 'sl',      ':split<CR>',        opts)

vim.keymap.set('n', 'su',     ':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>',  opts)
vim.keymap.set('n', 'sd',     ':set splitbelow<CR>:split<CR>',                       opts)
vim.keymap.set('n', 'sl',     ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>', opts)
vim.keymap.set('n', 'sr',     ':set splitright<CR>:vsplit<CR>',                      opts)

-- resize
vim.keymap.set('n', '<up>',    ':res +5<CR>',            opts)
vim.keymap.set('n', '<down>',  ':res -5<CR>',            opts)
vim.keymap.set('n', '<left>',  ':vertical resize-5<CR>', opts)
vim.keymap.set('n', '<right>', ':vertical resize+5<CR>', opts)

-- rotate windows
vim.keymap.set('n', 'srh', '<C-w>b<C-w>K', opts)
vim.keymap.set('n', 'srv', '<C-w>b<C-w>H', opts)

-- tab
function cycle_tabs()
  local current_tab = vim.fn.tabpagenr()
  local total_tabs = vim.fn.tabpagenr('$')

  if current_tab == total_tabs then
    vim.cmd('tabfirst')
  else
    vim.cmd('tabnext')
  end
end
vim.keymap.set('n', 'ts',      ':tab split<CR>', opts)
vim.keymap.set('n', '<Tab>',   ':lua cycle_tabs()<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':-tabnext<CR>', opts)

-----------------
-- Visual mode --
-----------------
-- 配置<, >来缩进
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
-- 搜索选中的内容
vim.keymap.set('v', '@', 'y/<c-r>"<cr>', opts)
-- 自动选中单词并搜索
vim.keymap.set('v', '//', 'ey/\\<<c-r>"\\><cr>', opts)

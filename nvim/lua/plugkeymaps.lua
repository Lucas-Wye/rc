local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
vim.keymap.set('n', 'nt', ':NvimTreeToggle<CR>', opts)

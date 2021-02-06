-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'git@github.com:wbthomason/packer.nvim.git', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------
        use {
          'nvim-tree/nvim-tree.lua',
          requires = {
            'nvim-tree/nvim-web-devicons', -- optional
          },
        }
        use { 'vim-airline/vim-airline' }
        use { 'vim-airline/vim-airline-themes' }
        -- color theme
        use { 'Mofiqul/vscode.nvim' }
        -- behavior
        if vim.fn.has('win32') == 0 then
          -- not used in Windows
          use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        end
        use {
          "windwp/nvim-autopairs",
          config = function() require("nvim-autopairs").setup {} end
        }

        -- search
        use {
          'nvim-telescope/telescope.nvim', tag = '0.1.4',
          requires = {
            'nvim-lua/plenary.nvim'
          }
        }

        -- latex: only used in Windows
        if vim.fn.has('win32') == 1 then
          use { 'lervag/vimtex' }
        end
        -- typst
        use { 'kaarmu/typst.vim', ft = {'typst'} }


        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-------------------- HELPERS ------------------------------

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local execute = vim.api.nvim_command
local fn = vim.fn

-------------------- PLUGINS ------------------------------

-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

--if fn.empty(fn.glob(install_path)) > 0 then
--  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
--  execute 'packadd packer.nvim'
--end

vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':tsupdate'
    }
    use {
        'nvim-treesitter/playground'
    }
    use('theprimeagen/harpoon')
    use('mbbill/undotree')


    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use 'folke/lsp-colors.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'nanozuki/tabby.nvim'
    use 'feline-nvim/feline.nvim'
    use 'tpope/vim-fugitive'
    use({ 'vladdoster/remember.nvim', config = [[ require('remember') ]] })
end)

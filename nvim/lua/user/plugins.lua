
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
        return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)

    -- My plugins here
    use "wbthomason/packer.nvim"                    -- Have packer manage itself
    use "nvim-lua/plenary.nvim"                     -- Useful lua functions used by lots of plugins
    -- use "nvim-lua/popup.nvim"                       -- An implementation of the Popup API from vim in Neovim

    -- colorschmes
    use { "catppuccin/nvim", as = "catppuccin" }    -- catppuccin theme
    -- use 'folke/tokyonight.nvim'                     -- tokyo-night theme

    -- completeion plugins
    use "hrsh7th/nvim-cmp"                          -- main completion engine
    use "hrsh7th/cmp-buffer"                        -- buffer completions
    use "hrsh7th/cmp-path"                          -- path completions
    use "hrsh7th/cmp-cmdline"                       -- command line completions
    use "lukas-reineke/cmp-under-comparator"        -- ordered suggestions
    use "hrsh7th/cmp-nvim-lsp"

    
    
    -- snippets plugins
    use "L3MON4D3/LuaSnip"                          --snippet engine
    use "rafamadriz/friendly-snippets"              -- a bunch of snippets to use
    use "saadparwaiz1/cmp_luasnip"


    -- LSP plugins
    use "neovim/nvim-lspconfig"                     -- enable LSP
    use "williamboman/mason.nvim"                   -- LSP installer
    use "williamboman/mason-lspconfig.nvim"         -- bridge mason and lspconfig
    use "nvim-lua/lsp-status.nvim"
    use ({ "glepnir/lspsaga.nvim", branch = "main" })
    use "onsails/lspkind.nvim"

    use "j-hui/fidget.nvim"

    -- formatter & linter config
    use "jose-elias-alvarez/null-ls.nvim"
    use "jay-babu/mason-null-ls.nvim"

    -- debugger
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"

    -- highlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    
    -- auto pairing
    use "windwp/nvim-autopairs"

    -- Comment
    use "numToStr/Comment.nvim"


    -- Diagnostics
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
        require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
        end
    }
    
    -- File Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- terminal 
    use "akinsho/toggleterm.nvim"

    -- which key
    use "folke/which-key.nvim"

    -- Git
    use { "lewis6991/gitsigns.nvim", tag = "release" }

    -- Motion
    use "ggandor/leap.nvim"                         -- quick navigation

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)



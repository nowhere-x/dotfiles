
-- lua init script required when nvim starts

require("user.options")
require("user.keymaps")
require("user.plugins")

require("user.plugin.colorscheme")
require("user.plugin.cmp")
require("user.plugin.comment")
require("user.plugin.nvim-tree")
require("user.plugin.lualine")
require("user.plugin.telescope")
require("user.plugin.treesitter")
require("user.plugin.autopairs")
require("user.plugin.toggleterm")
require("user.plugin.gitsigns")
require("user.plugin.fidget")

require("user.lsp.mason")
require("user.lsp.lspsaga")
require("user.lsp.lspconfig")
require("user.lsp.null-ls")




local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end


local keymap = vim.keymap


local on_attach = function (client, bufnr)

end


local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                }
            }
        }
    }
})

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd", "--background-index", "--clang-tidy", }
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

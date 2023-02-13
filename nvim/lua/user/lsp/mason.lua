
local status_mason, mason = pcall(require, "mason")
if not status_mason then
    return
end

local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lspconfig then
    return
end

local status_mason_null_is, mason_null_ls = pcall(require, "mason-null-ls")
if not status_mason_null_is then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",  -- lua lsp
        "clangd",       -- C & C++ & Objective-C & Objective-C++ & CUDA
        "pyright",      -- python
        "rust_analyzer",-- rust
        "tsserver",     -- javascript/typescript
        "texlab",       -- latex
    }
})

mason_null_ls.setup({
    ensure_installed = {
        "flake8",       -- python linter
        "ruff",       -- python linter
        "autopep8",     -- python formatter
        "stylua",       -- lua linter
        "cpplint",      -- C & C++ linter
        "clang_format", -- C & C++ & Java & CUDA formatter
    }
})

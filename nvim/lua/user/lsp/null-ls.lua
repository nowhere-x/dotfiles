
local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.ruff,           --python formatter
        formatting.stylua,          -- lua formatter
        formatting.rustfmt,         -- rust formatter
        formatting.clang_format,    -- C++ formatter
        diagnostics.ruff,         -- python linter
        diagnostics.selene,         -- lua linter
        diagnostics.clang_check,        -- C++ linter
    }
})


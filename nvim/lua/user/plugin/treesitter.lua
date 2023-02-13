
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter.setup({
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autopairs = {
        enable = true,
    },
    ensure_installed = {
        "json",
        "yaml",
        "toml",
        "markdown",
        "html",
        "lua",
        "vim",
        "bash",
        "cpp",
        "rust",
        "go",
        "java",
        "elixir",
        "zig",
        "python",
        "racket",
        "latex",
        "cmake",
        "dockerfile",
        "sql",
        "gitignore",
    },
    auto_installed = true,

})

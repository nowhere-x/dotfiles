
local status, fidget = pcall(require, "fidget.nvim")
if not status then
    return
end

fidget.setup({
    window = {
        blend = 0,
    }
})

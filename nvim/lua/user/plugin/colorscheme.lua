
local colorscheme = "catppuccin-mocha"

local status_ok, _ = pcall( vim.cmd, "colorscheme " .. colorscheme )
-- security check if theme exists
if not status_ok then
    return
end

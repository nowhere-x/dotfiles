
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
    return
end


autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string", "source", },
        javascript = { "string", "template_string", },
        java = false,
    },
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
})

-- local autopairs_cmp_status, autopairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
-- if not autopairs_cmp_status then
--     return
-- end
--
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
--   return
-- end

-- cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done)

require("nvim-autopairs").setup({
    check_ts = true,  -- Enable treesitter
    ts_config = {
        lua = {'string'},  -- Don't add pairs in lua string treesitter nodes
        javascript = {'template_string'},  -- Don't add pairs in javascript template_string
    },
}) 
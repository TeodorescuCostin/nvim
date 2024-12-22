local M = {}

function M.setup()
    require('nvim-treesitter.configs').setup({
        -- A list of parser names, or "all"
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "typescript",
            "python",
            "java",
            "c",
            "cpp",
            "rust",
            "go",
            "html",
            "css",
            "json",
            "yaml",
            "markdown",
            "markdown_inline",
            "bash",
            "regex",
            "gitignore",
            "dockerfile",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<C-s>",
                node_decremental = "<C-backspace>",
            },
        },
    })
end

return M 
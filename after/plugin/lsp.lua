local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Mason Setup
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Ensure these servers are installed
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",          -- Lua
        "pyright",         -- Python
        "jdtls",          -- Java
        "ruff",           -- Python linter
        "ts_ls",          -- TypeScript/JavaScript
        "rust_analyzer",   -- Rust
        "gopls",          -- Go
        "clangd",         -- C/C++
        "cssls",          -- CSS
        "html",           -- HTML
        "jsonls",         -- JSON
        "marksman",       -- Markdown
    },
    automatic_installation = true,
})

-- LSP server configurations
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    },
    pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace"
                }
            }
        }
    },
    ruff = {  -- Python linter configuration
        settings = {
            args = {},
        }
    },
    jdtls = {
        settings = {
            java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = 'fernflower' },
                completion = {
                    favoriteStaticMembers = {
                        "org.junit.Assert.*",
                        "org.junit.Assume.*",
                        "org.junit.jupiter.api.Assertions.*",
                        "org.junit.jupiter.api.Assumptions.*",
                        "org.junit.jupiter.api.DynamicContainer.*",
                        "org.junit.jupiter.api.DynamicTest.*",
                        "org.mockito.Mockito.*"
                    },
                    importOrder = {
                        "java",
                        "javax",
                        "com",
                        "org"
                    }
                },
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999
                    }
                },
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                    },
                    useBlocks = true
                }
            }
        }
    },
    ts_ls = {},  -- Using ts_ls for TypeScript/JavaScript
    rust_analyzer = {},
    gopls = {},
    clangd = {},
    cssls = {},
    html = {},
    jsonls = {},
    marksman = {},
}

-- Setup all servers
for server, config in pairs(servers) do
    config.capabilities = capabilities
    lspconfig[server].setup(config)
end

-- Global LSP key mappings
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show hover information" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Show signature help" })
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = "Go to type definition" })
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, { desc = "Format code" }) 
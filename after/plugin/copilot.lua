-- Copilot setup
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Use this for the new copilot.lua
vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.keymap.set('i', '<C-H>', 'copilot#Previous()', { expr = true })
vim.keymap.set('i', '<C-K>', 'copilot#Next()', { expr = true })
vim.keymap.set('i', '<C-O>', 'copilot#Dismiss()', { expr = true }) 
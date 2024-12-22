local theme = require('costin.theme')

-- Set initial theme
theme.set_theme(theme.current_theme)

-- Add keymapping to cycle themes
vim.keymap.set('n', '<leader>ct', function()
    theme.cycle_theme()
end, { desc = 'Cycle through themes' })

-- Add keymapping for specific themes
vim.keymap.set('n', '<leader>td', function()
    theme.set_theme('darcula')
end, { desc = 'Set Darcula theme' })

vim.keymap.set('n', '<leader>tg', function()
    theme.set_theme('github_dark')
end, { desc = 'Set GitHub theme' })

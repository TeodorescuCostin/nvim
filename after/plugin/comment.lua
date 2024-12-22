require('Comment').setup({
    padding = true,  -- Add a space between comment and line
    sticky = true,  -- Whether the cursor should stay at its position
    ignore = nil,  -- Lines to be ignored while (un)comment
    toggler = {
        line = 'gcc',  -- Line-comment toggle keymap
        block = 'gbc', -- Block-comment toggle keymap
    },
    opleader = {
        line = 'gc',  -- Line-comment keymap
        block = 'gb', -- Block-comment keymap
    },
}) 
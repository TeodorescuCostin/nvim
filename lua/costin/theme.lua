local M = {}

-- Available themes configuration
M.themes = {
    github_dark = {
        name = "github_dark_colorblind",
        style = "dark"
    },
    darcula = {
        name = "darcula",
        style = "dark"
    }
}

-- Get current theme from config or set default
M.current_theme = vim.g.theme or "github_dark"

-- Function to set theme
function M.set_theme(theme_key)
    local theme = M.themes[theme_key]
    if theme then
        vim.cmd.colorscheme(theme.name)
        -- Save the theme choice
        vim.g.theme = theme_key
        -- Update any additional theme-specific settings
        if theme_key == "github_dark" then
            -- GitHub theme specific settings
            vim.opt.background = "dark"
        elseif theme_key == "darcula" then
            -- Darcula specific settings
            vim.opt.background = "dark"
        end
    end
end

-- Function to cycle through themes
function M.cycle_theme()
    local themes_list = vim.tbl_keys(M.themes)
    local current_index = 1
    
    -- Find current theme index
    for i, theme in ipairs(themes_list) do
        if theme == M.current_theme then
            current_index = i
            break
        end
    end
    
    -- Get next theme
    local next_index = current_index % #themes_list + 1
    local next_theme = themes_list[next_index]
    
    -- Set the new theme
    M.set_theme(next_theme)
    M.current_theme = next_theme
    
    -- Notify user
    print("Switched to theme: " .. next_theme)
end

return M 
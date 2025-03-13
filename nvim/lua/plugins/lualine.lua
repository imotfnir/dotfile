local M = {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'}
}

function M.config()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = {
                left = '',
                right = ''
            },
            section_separators = {
                left = '',
                right = ''
            },
            disabled_filetypes = {
                statusline = {},
                winbar = {}
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename', 'filetype'},
            lualine_x = {'encoding', 'fileformat'},
            lualine_y = {'selectioncount', 'searchcount'},
            lualine_z = {'location', 'progress'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename', 'filetype'},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {
            -- lualine_a = {},
            -- lualine_b = {'branch'},
            -- lualine_c = {'filename'},
            -- lualine_x = {},
            -- lualine_y = {},
            -- lualine_z = {}
        },
        winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        inactive_winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        extensions = {}
    }
end

return M

-- https://github.com/nvim-lualine/lualine.nvim
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+
--
-- branch (git branch)
-- buffers (shows currently available buffers)
-- diagnostics (diagnostics count from your preferred source)
-- diff (git diff status)
-- encoding (file encoding)
-- fileformat (file format)
-- filename
-- filesize
-- filetype
-- hostname
-- location (location in file in line:column format)
-- mode (vim mode)
-- progress (%progress in file)
-- searchcount (number of search matches when hlsearch is active)
-- selectioncount (number of selected characters or lines)
-- tabs (shows currently available tabs)
-- windows (shows currently available windows)

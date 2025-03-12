return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>ff',
            function()
                require('telescope.builtin').find_files({
                })
            end,
            desc = 'Find Files',
        },
        {
            '<leader>fb',
            function()
                require('telescope.builtin').buffers({
                })
            end,
            desc = 'Open buffers in current neovim instance',
        },
        {
            '<leader>fc',
            function()
                require('telescope.builtin').commands({
                })
            end,
            desc = 'Lists available plugin/user commands',
        },
        {
            '<leader>fk',
            function()
                require('telescope.builtin').keymaps({
                })
            end,
            desc = 'Lists normal mode keymappings',
        },
        {
            '<leader>fk',
            function()
                require('telescope.builtin').man_pages({
                })
            end,
            desc = 'man pages',
        },
        {
            '<leader>fgst',
            function()
                require('telescope.builtin').git_status({
                })
            end,
            desc = 'git status',
        },
        {
            '<leader>fgb',
            function()
                require('telescope.builtin').git_branches({
                })
            end,
            desc = 'git branch',
        },
        {
            '<leader>fgc',
            function()
                require('telescope.builtin').git_commits({
                })
            end,
            desc = 'git commit',
        },
        {
            '<leader>fj',
            function()
                require('telescope.builtin').jumplist({
                })
            end,
            desc = 'jump',
        },
        {
            '<leader>fl',
            function()
                require('telescope.builtin').loclist({
                })
            end,
            desc = 'loclist',
        },
    },
    opts = {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key"
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        }

    }
}

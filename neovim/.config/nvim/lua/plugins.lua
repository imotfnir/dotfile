-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


-- Import Plugin
vim.g.neo_tree_remove_legacy_commands = 1
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- You add plugins here
  use {
    "EdenEast/nightfox.nvim",
  config = function()
    require("other_plugins.nightfox")
  end,
  }
  -- Packer
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
            -- ...
        },
        -- ...
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end,

  }
  use {
    'romgrk/barbar.nvim',
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("other_plugins.barbar")
    end,
  }
  use "terryma/vim-multiple-cursors" -- CTRL·+·N·for·multiple·cursors
  use "ntpeters/vim-better-whitespace" -- Whitespace characters highlighted
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
  } -- Browse the file system
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end,
  }
end)



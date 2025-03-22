local M = {
  "stevearc/conform.nvim",
  opts = function()
    local plugin = require("lazy.core.config").plugins["conform.nvim"]
    if plugin.config ~= M.setup then
      LazyVim.error({
        "Don't set `plugin.config` for `conform.nvim`.\n",
        "This will break **LazyVim** formatting.\n",
        "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
      }, { title = "LazyVim" })
    end
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        go = { "goimports", "gofmt" },
        python = { "isort", "black" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        c = { "clang-format" },
        -- You can use a function here to determine the formatters dynamically

        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        ["clang-format"] = {
          command = "clang-format",
          args = { "--style=file", "$FILENAME" },
        },
        my_formatter = {},
      },
    }
    return opts
  end,
}

return M

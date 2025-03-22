local M = {
  "stevearc/conform.nvim",
  opts = {},
}

function M.config()
  require("conform").setup({
    log_level = vim.log.levels.DEBUG,
    notify_on_error = true,
    -- Conform will notify you when no formatters are available for the buffer
    notify_no_formatters = true,
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      go = { "goimports", "gofmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
      -- You can also customize some of the format options for the filetype
      -- You can use a function here to determine the formatters dynamically
      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = { "codespell" },
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
    formatters = {
      my_formatter = {
        command = "format_command",
        args = { "--", "$FILENAME" },
      },
      my_formatter = {},
    },
  })
end

return M

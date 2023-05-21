return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = {
    ui = {
      border = "rounded",
      -- notification_style = "native" | "plugin",
    },
    decorations = {
      statusline = {
        app_version = false,
        device = true,
      },
    },
    widget_guides = {
      enabled = true,
    },
    closing_tags = {
      highlight = "ErrorMsg",
      prefix = "//",
      enabled = true,
    },
    lsp = {
      color = {
        enabled = false,
        background = false,
        foreground = false,
        virtual_text = true,
        virtual_text_str = "■",
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        enableSnippets = true,
      },
    },
    debugger = {
      enabled = true,
      run_via_dap = false,
    },
  },
}

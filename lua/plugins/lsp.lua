return {
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = { timeout_ms = 3000 },
    },
  },

  -- tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "eslint_d",
        "eslint-lsp",
        "flake8",
        "isort",
        "luacheck",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },

  -- null-ls
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local nls = require("null-ls")
      local formatting = nls.builtins.formatting
      local diagnostics = nls.builtins.diagnostics
      local actions = nls.builtins.code_actions
      local hover = nls.builtins.hover

      nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          -- Formatting
          formatting.stylua,
          -- formatting.fish_indent,
          formatting.prettierd.with({
            filetypes = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "graphql",
              "json",
              "html",
              "yaml",
              "markdown",
              "css",
              -- "liquid",
            },
          }),
          formatting.pg_format,
          formatting.gofumpt,
          formatting.goimports,
          formatting.golines,

          formatting.black,

          diagnostics.flake8,
          diagnostics.markdownlint,
          diagnostics.rubocop.with({
            command = "rubocop-daemon-wrapper",
          }),
          diagnostics.golangci_lint,
          diagnostics.tidy,
          diagnostics.eslint_d,
          diagnostics.shellcheck,

          -- Code Actions
          -- actions.eslint,
          actions.eslint_d,
          actions.shellcheck,
          actions.gitsigns,
          actions.refactoring,

          -- Hover
          hover.printenv,
          hover.dictionary,
        },
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      })
    end,
  },

  -- highlight arguments
  {
    "m-demare/hlargs.nvim",
    event = "LspAttach",
    opts = {},
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = true,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "VidocqH/lsp-lens.nvim",
    event = "LspAttach",
    opts = {
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = {                 -- Enable / Disable specific request
        definition = false,
        references = true,
        implementation = true,
      },
      ignore_filetype = {
        "prisma",
      },
    },
  },
  -- language specific extension modules
  { import = "plugins.extras.lang.js-ts" },
  { import = "plugins.extras.lang.python" },
  -- { import = "plugins.extras.lang.ruby" },
  -- { import = "plugins.extras.lang.go" },
  -- { import = "plugins.extras.lang.liquid" },
}

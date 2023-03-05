return {

  -- projects
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        ignore_lsp = { "null-ls" },
        patterns = { ".git" },
      })
    end,
  },

  -- neorg
  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.integrations.nvim-cmp"] = {},
      },
    },
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    keys = {
      {
        "<leader>op",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    opts = { theme = "dark" }, -- 'dark' or 'light'
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      require("which-key").register({
        ["<leader>o"] = { name = "+open" },
      })
    end,
    ft = { "markdown" },
  },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
  },

  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    config = function()
      require("numb").setup()
    end,
  },

  "wellle/targets.vim",

  { "rafcamlet/nvim-luapad", cmd = "Luapad" },

  {
    "bennypowers/nvim-regexplainer",
    event = "BufRead",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter", "MunifTanjim/nui.nvim" },
  },
  { "itchyny/vim-highlighturl", event = "VeryLazy" },

  {
    "lukas-reineke/headlines.nvim",
    ft = { "org", "norg", "markdown", "yaml" },
    config = function()
      require("headlines").setup({
        markdown = {
          headline_highlights = { "Headline1", "Headline2", "Headline3" },
        },
        org = {
          headline_highlights = false,
        },
        norg = { codeblock_highlight = false },
      })
    end,
  },

  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = true,
  },

  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    opts = {
      hide = {
        virtual_text = false,
        signs = false,
        underline = false,
      },
    },
  },

  {
    "LudoPinelli/comment-box.nvim",
    event = "BufReadPre",
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },
}

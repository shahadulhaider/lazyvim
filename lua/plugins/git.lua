return {
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "f-person/git-blame.nvim",

    event = "VeryLazy",
    config = true,
  },
  -- {
  --   "NeogitOrg/neogit",
  --   event = { "BufReadPost" },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "sindrets/diffview.nvim",
  --   },
  --   keys = {
  --     { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
  --   },
  --   config = function()
  --     require("neogit").setup({
  --       integrations = {
  --         diffview = true,
  --       },
  --     })
  --   end,
  -- },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" } },
  },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      local gitlinker = require("gitlinker")
      gitlinker.setup(opts)
    end,
  },
  { "pwntester/octo.nvim", cmd = "Octo", config = true },
}

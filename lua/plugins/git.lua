return {
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "NeogitOrg/neogit",
    event = { "BufReadPost" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,
        },
      })
    end,
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

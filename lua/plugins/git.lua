return {
  {
    "f-person/git-blame.nvim",
    event = { "BufReadPre" },
  },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    config = true,
  },
  {

    "TimUntersberger/neogit",
    event = { "BufReadPre" },
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },
  { "rhysd/git-messenger.vim", event = "BufRead" },
  { "rhysd/committia.vim", event = "BufRead" },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup()
    end,
  },
  { "pwntester/octo.nvim", cmd = "Octo", config = true },
}

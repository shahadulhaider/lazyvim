return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    event = "VeryLazy",
    opts = { -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 10
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
    },
    keys = {
      {
        "<leader>ot",
        "<cmd>ToggleTerm<cr>",
        desc = "Terminal (root)",
      },
      {
        "<leader>oT",
        "<cmd>ToggleTerm dir=%:h<cr>",
        desc = "Terminal (cwd)",
      },
      {
        "<F7>",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "Terminal (root)",
      },
      {
        "<F8>",
        "<cmd>ToggleTerm direction=float dir=%:h<cr>",
        desc = "Terminal (cwd)",
      },
    },
  },

  {
    "willothy/flatten.nvim",
    opts = {},
    lazy = false,
    priority = 1001,
  },
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction ",
      "OverseerClearCache",
    },
    opts = {},
  },
}

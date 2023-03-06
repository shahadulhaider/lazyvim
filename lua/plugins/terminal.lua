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
        "<cmd>ToggleTerm direction=horizontal<cr>",
        desc = "Terminal",
      },
      {
        "<leader>oT",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "Terminal (float)",
      },
    },
  },
}

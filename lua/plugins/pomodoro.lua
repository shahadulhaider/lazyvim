return {
  "wthollingsworth/pomodoro.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  keys = {
    {
      "<leader>zp",
      "<cmd>PomodoroStart<cr>",
      desc = "Start pomodoro",
    },
  },

  config = function()
    require("pomodoro").setup({
      time_work = 25,
      time_break_short = 5,
      time_break_long = 20,
      timers_to_long_break = 4,
    })
  end,
}

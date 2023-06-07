return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
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
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- local Terminal = require("toggleterm.terminal").Terminal
      --
      -- local lazygit = Terminal:new({
      --   cmd = "lazygit",
      --   dir = "git_dir",
      --   hidden = true,
      --   direction = "float",
      --   highlights = {
      --     FloatBorder = { guibg = "", guifg = "" },
      --     NormalFloat = { guibg = "Black" },
      --   },
      --   on_open = function(term)
      --     vim.cmd("startinsert!")
      --     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      --   end,
      --   ---@diagnostic disable-next-line: unused-local
      --   on_close = function(term)
      --     vim.cmd("startinsert!")
      --   end,
      -- })
      --
      -- local btop = Terminal:new({
      --   cmd = "btop",
      --   hidden = true,
      --   direction = "float",
      --   on_open = function(term)
      --     vim.cmd("startinsert!")
      --     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      --   end,
      --   on_close = function(term)
      --     vim.cmd("startinsert!")
      --   end,
      --   highlights = {
      --     FloatBorder = { guibg = "Black", guifg = "DarkGray" },
      --     NormalFloat = { guibg = "Black" },
      --   },
      -- })
      --
      -- local lf = Terminal:new({
      --   cmd = "lf",
      --   hidden = true,
      --   direction = "float",
      --   on_open = function(term)
      --     vim.cmd("startinsert!")
      --     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      --   end,
      --   on_close = function(term)
      --     vim.cmd("startinsert!")
      --   end,
      --   float_opts = {
      --     height = function()
      --       return math.floor(vim.o.lines * 0.8)
      --     end,
      --     width = function()
      --       return math.floor(vim.o.columns * 0.95)
      --     end,
      --   },
      -- })
      --
      -- function _Lazygit_toggle()
      --   lazygit:toggle()
      -- end
      --
      -- function _Btop()
      --   btop:toggle()
      -- end
      --
      -- function _Lf()
      --   lf:toggle()
      -- end
    end,
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
      -- {
      --   "<leader>og",
      --   "<cmd>lua _Lazygit_toggle()<CR>",
      --   desc = "Git",
      -- },
      -- {
      --   "<leader>ob",
      --   "<cmd>lua _Btop()<CR>",
      --   desc = "Btop",
      -- },
    },
  },
}

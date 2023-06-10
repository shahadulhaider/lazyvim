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
      highlights = {
        FloatBorder = { guibg = "#16161e", guifg = "#16161e" },
        NormalFloat = { guibg = "#16161e" },
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        hidden = true,
        direction = "float",
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        ---@diagnostic disable-next-line: unused-local
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
        float_opts = {
          border = "none",
          winblend = 0,
          height = function()
            return math.floor(vim.o.lines * 0.8)
          end,
          width = function()
            return math.floor(vim.o.columns * 0.95)
          end,
        },
      })

      local btop = Terminal:new({
        cmd = "btop",
        hidden = true,
        direction = "float",
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      local lf = Terminal:new({
        cmd = "lf",
        hidden = true,
        direction = "float",
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
        float_opts = {
          height = function()
            return math.floor(vim.o.lines * 0.8)
          end,
          width = function()
            return math.floor(vim.o.columns * 0.95)
          end,
        },
      })

      function _Lazygit_toggle()
        lazygit:toggle()
      end

      function _Btop()
        btop:toggle()
      end

      function _Lf()
        lf:toggle()
      end

      require("which-key").register({
        ["<leader>t"] = { name = "+terminal" },
      })
    end,
    keys = {
      {
        "<leader>tt",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "Terminal (root)",
      },
      {
        "<leader>tT",
        "<cmd>ToggleTerm direction=float dir=%:p:h<cr>",
        desc = "Terminal (here)",
      },
      {
        "<leader>ts",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        desc = "Terminal (split)",
      },
      {
        "<leader>tv",
        "<cmd>ToggleTerm direction=vertical<cr>",
        desc = "Terminal (vsplit)",
      },
      {
        "<leader>tg",
        "<cmd>lua _Lazygit_toggle()<CR>",
        desc = "Git",
      },
      {
        "<leader>tb",
        "<cmd>lua _Btop()<CR>",
        desc = "Btop",
      },
      {
        "<leader>tf",
        "<cmd>lua _Lf()<CR>",
        desc = "Files",
      },
    },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      { "nvim-telescope/telescope-file-browser.nvim" },
      -- { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
      { "debugloop/telescope-undo.nvim" },
    },

    keys = {
      {
        "<leader>,",
        function()
          require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = true })
        end,
        desc = "Find Files (cwd)",
      },
      {
        "<leader>bb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Switch Buffers",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin Files",
      },
    },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },

      extensions = {
        project = {
          base_dirs = {
            { "~/code/otter/" },
          },
        },
        undo = {
          use_delta = true,
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.4,
          },
        },
        file_browser = {
          hidden = {
            file_browser = true,
            folder_browser = true,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      -- telescope.load_extension("dap")
      telescope.load_extension("project")
      telescope.load_extension("undo")
    end,
  },
}

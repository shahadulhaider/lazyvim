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
        layout_config = {
          prompt_position = "top",
          horizontal = {
            anchor = "N",
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
        hidden = true,
        path_display = {
          truncate = 2,
          -- shorten = {
          --   len = 1,
          --   exclude = { 1, -1 },
          -- },
        },
        file_ignore_patterns = {
          "node_modules",
          "package-lock.json",
        },
      },
      pickers = {
        find_files = {
          previewer = false,
          layout_config = {
            height = 20,
            width = 80,
          },
        },
        git_files = {
          previewer = false,
          layout_config = {
            height = 20,
            width = 80,
          },
        },
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
          previewer = false,
          layout_config = {
            height = 20,
            width = 80,
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

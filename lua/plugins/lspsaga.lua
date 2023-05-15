return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = true,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- keys = function()
  --   return {
  --     { "]x", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostic" },
  --     { "[x", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous diagnostic" },
  --     { "ga", "<cmd>Lspsaga code_action<cr>", desc = "Code actions" },
  --     { "gd", "<cmd>Lspsaga lsp_finder<cr>", desc = "Definition, references & implentations" },
  --     { "gD", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
  --     { "gh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover" },
  --     { "go", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
  --     { "gt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Go to type definition" },
  --     { "<leader>a", "ga", desc = "Actions", remap = true },
  --     { "<leader>xn", "]x", desc = "Next diagnostic", remap = true },
  --     { "<leader>xp", "[x", desc = "Previous diagnostic", remap = true },
  --   }
  -- end,
}

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Dashboard
-- keymap("n", "<leader>;", function()
--   -- close all open buffers before open dashboard
--   for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
--     local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
--     if buftype ~= "terminal" then
--       vim.api.nvim_buf_delete(bufnr, { force = true })
--     end
--   end
-- end, opts)

-- Copy whole file content to clipboard with C-y
keymap("n", "<C-y>", ":%y+<CR>", opts)

-- Move live up or down
-- moving
keymap("n", "<A-Down>", ":m .+1<CR>", opts)
keymap("n", "<A-Up>", ":m .-2<CR>", opts)
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- NullLs Info keymap
if Util.has("null-ls.nvim") then
  keymap("n", "<leader>cn", "<cmd>NullLsInfo<CR>", opts)
end

-- LspSaga
if Util.has("lspsaga.nvim") then
  -- when you use action in finder like open vsplit then you can
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

  -- Code action
  keymap({ "n", "v" }, "gla", "<cmd>Lspsaga code_action<CR>")

  -- Rename all occurrences of the hovered word for the entire file
  keymap("n", "glr", "<cmd>Lspsaga rename<CR>")

  -- Rename all occurrences of the hovered word for the selected files
  keymap("n", "glR", "<cmd>Lspsaga rename ++project<CR>")

  -- Peek definition
  keymap("n", "gld", "<cmd>Lspsaga peek_definition<CR>")

  -- Diagnostic jump can use `<c-o>` to jump back
  keymap("n", "[x", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  keymap("n", "]x", "<cmd>Lspsaga diagnostic_jump_next<CR>")

  -- Diagnostic jump with filters such as only jumping to an error
  keymap("n", "[X", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  keymap("n", "]X", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)

  -- Toggle Outline
  keymap("n", "go", "<cmd>Lspsaga outline<CR>")

  -- Callhierarchy
  keymap("n", "gli", "<cmd>Lspsaga incoming_calls<CR>")
  keymap("n", "glo", "<cmd>Lspsaga outgoing_calls<CR>")
end

-- gitlinker
if Util.has("gitlinker.nvim") then
  keymap(
    "n",
    "<leader>gb",
    '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
    { silent = true, desc = "GitLink Open in Browser" }
  )
  keymap(
    "v",
    "<leader>gb",
    '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
    { desc = "GitLink Open in Browser" }
  )
  keymap(
    "n",
    "<leader>gy",
    '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
    { silent = true, desc = "GitLink Copy" }
  )
  keymap("v", "<leader>gy", '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', { desc = "GitLink Copy" })
end

keymap("n", "<leader>gm", "<cmd>Gitsigns blame_line<CR>", { desc = "Git Blame" })

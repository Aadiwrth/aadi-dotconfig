-- lazyvim-cheatsheet.lua
-- Place this file at: ~/.config/nvim/lua/user/cheatsheet.lua
-- Then add the keymap below to your keymaps file (e.g. ~/.config/nvim/lua/custom/keymaps.lua)
-- and require("user.cheatsheet") will be available automatically.
--
-- Keymap to add (example):
-- vim.keymap.set('n', '<leader>h', require('user.cheatsheet').toggle, { desc = 'Cheatsheet' })
--
-- Optional which-key registration (add somewhere in your keymaps/init):
-- local wk = require('which-key')
-- wk.register({ h = { "<cmd>lua require('user.cheatsheet').toggle()<CR>", "Cheatsheet" } }, { prefix = "<leader>" })

local M = {}
local buf = nil
local win = nil

local content = {
  "📘  LazyVim Cheatsheet",
  "",
  "— Editing —",
  "  gc        - toggle comment",
  "  gb        - block comment",
  "  > / <     - indent / outdent",
  "  yyp       - duplicate current line",
  "",
  "— File Navigation —",
  "  <leader>e  - file explorer",
  "  <leader>ff - find file (Telescope)",
  "  <leader>fg - live grep",
  "  <leader>fb - list buffers",
  "  <leader>fr - recent files",
  "",
  "— Buffer / Tab —",
  "  <Tab>      - next buffer",
  "  <S-Tab>    - previous buffer",
  "  <leader>bd - close buffer",
  "",
  "— LSP / Code —",
  "  K          - hover doc",
  "  gd         - goto definition",
  "  gr         - references",
  "  <leader>cr - rename",
  "  <leader>cf - format file",
  "  <leader>ca - code actions",
  "",
  "— Movement / Splits —",
  "  <C-h/j/k/l> - jump between splits",
  "  <C-Arrow>   - resize splits (depends on config)",
  "",
  "— Git (Gitsigns) —",
  "  ]h         - next git hunk",
  "  [h         - prev git hunk",
  "  <leader>gb - git blame line",
  "  <leader>gs - git status",
  "",
  "— Utilities —",
  "  <leader>tt - toggle terminal",
  "  <leader>tf - toggle floating terminal",
  "  <leader>l  - lazy (plugins menu)",
  "  <leader>u  - toggle undo tree",
  "",
  "— Tips —",
  "  Press <leader>h again to close this window.",
  "  You can customize the list at ~/.config/nvim/lua/user/cheatsheet.lua",
}

local function valid_win(w)
  return w and vim.api.nvim_win_is_valid(w)
end

function M.open()
  if buf and vim.api.nvim_buf_is_valid(buf) and valid_win(win) then
    return
  end

  buf = vim.api.nvim_create_buf(false, true) -- listed=false, scratch=true
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "filetype", "markdown")

  local width = math.floor(vim.o.columns * 0.6)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }

  win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_win_set_option(win, "wrap", false)
  -- close on <esc> or q
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "q",
    '<cmd>lua require("user.cheatsheet").close()<CR>',
    { nowait = true, noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "<esc>",
    '<cmd>lua require("user.cheatsheet").close()<CR>',
    { nowait = true, noremap = true, silent = true }
  )
end

function M.close()
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
  if buf and vim.api.nvim_buf_is_valid(buf) then
    pcall(vim.api.nvim_buf_delete, buf, { force = true })
  end
  buf = nil
  win = nil
end

function M.toggle()
  if win and vim.api.nvim_win_is_valid(win) then
    M.close()
  else
    M.open()
  end
end

return M

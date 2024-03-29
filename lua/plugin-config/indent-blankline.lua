-- local status, ident_blankline = pcall(require, "indent_blankline")
local status, ident_blankline = pcall(require, "ibl")
if not status then
  vim.notify("Not find: indent_blankline")
  return
end

-- ident_blankline.setup({
--   -- 空行占位
--   space_char_blankline = " ",
--   -- 用 treesitter 判断上下文
--   show_current_context = true,
--   show_current_context_start = true,
--   context_patterns = {
--     "class",
--     "function",
--     "method",
--     "element",
--     "^if",
--     "^while",
--     "^for",
--     "^object",
--     "^table",
--     "block",
--     "arguments",
--   },
--   -- :echo &filetype
--   filetype_exclude = {
--     "dashboard",
--     "packer",
--     "terminal",
--     "help",
--     "log",
--     "markdown",
--     "TelescopePrompt",
--     "lsp-installer",
--     "lspinfo",
--     "toggleterm",
--   },
--   -- 竖线样式
--   -- char = '¦'
--   -- char = '┆'
--   -- char = '│'
--   -- char = "⎸",
--   char = "▏",
-- })
ident_blankline.setup()


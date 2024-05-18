-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

function Transparent(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)

  -- Set background for various elements
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- Sign column
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- Non-current line
  vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" }) -- Message area
  vim.api.nvim_set_hl(0, "LineNumber", { bg = "none" }) -- Line numbers (optional)
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" }) -- Cursor line (optional)
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" }) -- Cursor line number (optional)
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" }) -- Telescope plugin border (if applicable)
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" }) -- NvimTree plugin normal (if applicable)

  -- Additional transparency options (explore with caution):
  -- vim.opt.transparency = 1  -- May not work on all terminals
  -- vim.opt.background = "none"  -- Might affect other elements besides background
end
Transparent("fluoromachine")

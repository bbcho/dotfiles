-- R ftplugin for notebook-style development
-- Uses same # %% cell markers as Python for consistency

-- Setup notebook cell keymaps for R files
require("notebook-cells").setup_keymaps()

-- Helpful settings for notebook-style editing
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = [[getline(v:lnum)=~'^# %%'?'>1':getline(v:lnum-1)=~'^# %%'?'1':'=']]
vim.opt_local.foldlevel = 99 -- Start with all folds open

-- Highlight cell markers
vim.cmd([[
  syntax match CellMarker /^# %%.*$/ containedin=rComment
  highlight link CellMarker Special
]])

-- R-specific settings
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

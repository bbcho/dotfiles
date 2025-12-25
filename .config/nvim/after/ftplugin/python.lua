-- Python ftplugin for notebook-style development
-- Place in after/ftplugin/python.lua

-- Setup notebook cell keymaps for Python files
require("notebook-cells").setup_keymaps()

-- Helpful settings for notebook-style editing
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = [[getline(v:lnum)=~'^# %%'?'>1':getline(v:lnum-1)=~'^# %%'?'1':'=']]
vim.opt_local.foldlevel = 99 -- Start with all folds open

-- Highlight cell markers
vim.cmd([[
  syntax match CellMarker /^# %%.*$/ containedin=pythonComment
  highlight link CellMarker Special
]])

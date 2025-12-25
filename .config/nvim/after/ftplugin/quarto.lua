-- Quarto ftplugin for .qmd files
-- Activates otter.nvim for embedded language support

-- Auto-activate otter for LSP features in code chunks
vim.defer_fn(function()
  local ok, otter = pcall(require, "otter")
  if ok then
    otter.activate()
  end
end, 100)

-- Quarto-specific settings
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.conceallevel = 0 -- Show markdown syntax

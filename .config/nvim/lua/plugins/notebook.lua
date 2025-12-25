-- Notebook-style Python development with # %% cells
-- LazyVim compatible - place in ~/.config/nvim/lua/plugins/notebook.lua
-- Requires: Kitty terminal for image rendering
--
-- VERIFIED SOURCES:
-- https://github.com/benlubas/molten-nvim
-- https://github.com/3rd/image.nvim

return {
  -- Image rendering in Kitty
  -- https://github.com/3rd/image.nvim
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      backend = "kitty", -- or "ueberzug" or "sixel"
      processor = "magick_cli", -- or "magick_rock"
      integrations = {},
      -- integrations = {
      --   markdown = { enabled = false }, -- we're not using markdown integration
      --   neorg = { enabled = false },
      -- },
      -- max_width = 100,
      -- max_height = 20,
      max_height_window_percentage = 40,
      -- max_width_window_percentage = 70,
      -- window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },

  -- Jupyter kernel integration
  -- https://github.com/benlubas/molten-nvim
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- Image provider
      vim.g.molten_image_provider = "image.nvim"

      -- Output window settings
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = true

      -- Virtual text output (shows output below code)
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true

      -- Wrap output for readability
      vim.g.molten_wrap_output = true
    end,

    -- Keymaps based on official README examples
    keys = {
      -- Initialize kernel
      { "<leader>mi", "<cmd>MoltenInit<CR>", desc = "Molten init kernel" },

      -- Evaluate code
      -- MoltenEvaluateOperator: use like `<leader>me` then a motion (e.g., `ip` for paragraph)
      { "<leader>me", "<cmd>MoltenEvaluateOperator<CR>", desc = "Molten evaluate operator" },
      { "<leader>ml", "<cmd>MoltenEvaluateLine<CR>", desc = "Molten evaluate line" },
      -- Visual selection: needs :<C-u> prefix and gv suffix per docs
      { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Molten evaluate visual" },

      -- Re-evaluate and manage cells
      { "<leader>mr", "<cmd>MoltenReevaluateCell<CR>", desc = "Molten re-evaluate cell" },
      { "<leader>md", "<cmd>MoltenDelete<CR>", desc = "Molten delete cell" },

      -- Output management
      { "<leader>mo", "<cmd>MoltenShowOutput<CR>", desc = "Molten show output" },
      { "<leader>mh", "<cmd>MoltenHideOutput<CR>", desc = "Molten hide output" },
      -- MoltenEnterOutput must be called with noautocmd per docs
      { "<leader>mO", "<cmd>noautocmd MoltenEnterOutput<CR>", desc = "Molten enter output" },

      -- Kernel management
      { "<leader>mx", "<cmd>MoltenInterrupt<CR>", desc = "Molten interrupt" },
      { "<leader>mR", "<cmd>MoltenRestart<CR>", desc = "Molten restart kernel" },

      -- Cell navigation (built-in Molten commands)
      { "<leader>mn", "<cmd>MoltenNext<CR>", desc = "Molten next cell" },
      { "<leader>mp", "<cmd>MoltenPrev<CR>", desc = "Molten prev cell" },

      -- Save/load outputs
      { "<leader>ms", "<cmd>MoltenSave<CR>", desc = "Molten save" },
      { "<leader>mL", "<cmd>MoltenLoad<CR>", desc = "Molten load" },

      -- Open output in browser (for HTML outputs like Plotly)
      { "<leader>mb", "<cmd>MoltenOpenInBrowser<CR>", desc = "Molten open in browser" },
    },
  },
}

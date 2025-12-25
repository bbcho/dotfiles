-- Python virtual environment selector
-- Works with uv, venv, virtualenv, conda, poetry, etc.

return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      settings = {
        search = {
          -- Search for .venv in project root (uv default)
          project_venv = {
            command = "fd -H -I -a -t d ^.venv$ . -d 1",
            type = "anaconda",
          },
        },
      },
    },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python venv" },
      { "<leader>cV", "<cmd>VenvSelectCached<cr>", desc = "Select cached venv" },
    },
    event = "VeryLazy",
  },
}

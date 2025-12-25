return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- Terminal window settings
    window = {
      position = "vertical", -- vertical split (or "horizontal", "float")
      width = 80,
      height = 20,
    },
  },
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<CR>", desc = "Claude Code toggle" },
    { "<leader>cs", "<cmd>ClaudeCodeSend<CR>", mode = "v", desc = "Send to Claude" },
    { "<leader>co", "<cmd>ClaudeCodeOpen<CR>", desc = "Claude Code open" },
    { "<leader>cx", "<cmd>ClaudeCodeClose<CR>", desc = "Claude Code close" },
  },
}

-- AI coding assistance with Claude
--
-- SOURCES:
-- https://github.com/yetone/avante.nvim

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- use latest
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- Optional but recommended
      "nvim-mini/mini.icons",
      -- For image pasting support
      "HakonHarnes/img-clip.nvim",
      -- For markdown rendering in chat
      "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = {
      -- Use Claude as the provider
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-opus-4-5-20251101", -- opus 4.5 for complex tasks
          extra_request_body = {
            temperature = 0,
            max_tokens = 65536,
          },
        },
      },
      -- Customize behavior
      behaviour = {
        auto_suggestions = false, -- set true for copilot-like suggestions
        auto_set_keymaps = true,
        auto_set_highlight_group = true,
        support_paste_from_clipboard = true,
      },
      -- File selector for context
      file_selector = {
        provider = "native", -- or "telescope" if you have it
      },
      -- Window appearance
      windows = {
        position = "right",
        width = 40, -- percentage
        sidebar_header = {
          align = "center",
        },
      },
      -- Hints in UI
      hints = {
        enabled = true,
      },
    },
    keys = {
      { "<leader>aa", function() require("avante.api").ask() end, desc = "Avante ask", mode = { "n", "v" } },
      { "<leader>ae", function() require("avante.api").edit() end, desc = "Avante edit", mode = "v" },
      { "<leader>ar", function() require("avante.api").refresh() end, desc = "Avante refresh" },
      { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Avante toggle" },
      { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Avante focus" },
    },
  },

  -- Image paste support for avante
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = { insert_mode = true },
      },
    },
  },

  -- Markdown rendering in avante chat
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
}

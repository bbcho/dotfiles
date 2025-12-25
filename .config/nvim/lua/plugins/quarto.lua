-- Quarto and R support for data science workflows
-- Integrates with molten-nvim for code execution
--
-- SOURCES:
-- https://github.com/quarto-dev/quarto-nvim
-- https://github.com/jmbuhr/otter.nvim

return {
  -- Quarto document support
  -- Provides cell execution, preview, and LSP features for .qmd files
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "quarto", "markdown" },
    opts = {
      lspFeatures = {
        enabled = true,
        chunks = "all", -- 'curly' for {python}, 'all' for all code chunks
        languages = { "r", "python", "julia", "bash", "lua" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten", -- use molten-nvim for execution
        ft_runners = {
          python = "molten",
          r = "molten",
        },
      },
    },
    keys = {
      -- Run code cells
      { "<leader>qc", function() require("quarto.runner").run_cell() end, desc = "Quarto run cell" },
      { "<leader>qa", function() require("quarto.runner").run_above() end, desc = "Quarto run above" },
      { "<leader>qA", function() require("quarto.runner").run_all() end, desc = "Quarto run all" },
      { "<leader>ql", function() require("quarto.runner").run_line() end, desc = "Quarto run line" },
      { "<leader>qv", function() require("quarto.runner").run_range() end, mode = "v", desc = "Quarto run selection" },

      -- Preview
      { "<leader>qp", "<cmd>QuartoPreview<CR>", desc = "Quarto preview" },
      { "<leader>qP", "<cmd>QuartoClosePreview<CR>", desc = "Quarto close preview" },

      -- Activate otter (embedded language features)
      { "<leader>qo", function() require("otter").activate() end, desc = "Otter activate" },
    },
  },

  -- Otter: LSP features for embedded code in Quarto/markdown
  -- Provides completion, diagnostics, hover for code inside ```{lang} blocks
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      buffers = {
        set_filetype = true, -- set filetype of otter buffers
      },
      handle_leading_whitespace = true,
    },
  },

  -- R language server
  -- Install with :MasonInstall r-languageserver
  -- Also requires R package: install.packages("languageserver")
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        r_language_server = {},
      },
    },
  },

  -- Ensure R LSP is installed via Mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "r-languageserver" })
    end,
  },

  -- Treesitter parsers needed for Quarto chunk detection
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "markdown",
        "markdown_inline",
        "r",
        "python",
        "yaml", -- for Quarto front matter
      })
    end,
  },
}

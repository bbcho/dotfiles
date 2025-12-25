-- Custom snippets configuration
-- Loads VSCode-style snippets from ~/.config/nvim/snippets/

return {
  -- Add custom snippets path to blink.cmp
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          snippets = {
            opts = {
              search_paths = {
                vim.fn.stdpath("config") .. "/snippets",
              },
            },
          },
        },
      },
    },
  },
}

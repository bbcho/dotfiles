-- GitHub Copilot inline completions
--
-- SOURCE:
-- https://github.com/zbirenbaum/copilot.lua

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<C-Right>",
          accept_line = "<C-End>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false }, -- disable panel, use suggestions only
      filetypes = {
        markdown = true,
        python = true,
        r = true,
        quarto = true,
        yaml = true,
        lua = true,
        sh = true,
        bash = true,
        ["."] = false, -- disable for other filetypes by default
      },
    },
  },
}

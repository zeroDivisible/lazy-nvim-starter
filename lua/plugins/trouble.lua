-- plugin makes it easier to navigate with issues found in projects
return {
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
    cmd = "TroubleToggle",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble (Buffer)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
      {
        "<leader>xr",
        "<cmd>Trouble lsp toggle focus=false win.position=right win.width=20<cr>",
        desc = "LSP References",
      },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "TODOs" },
    },
  },
}

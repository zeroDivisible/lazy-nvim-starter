return {
  -- allows showing blame in virtual buffer, etc
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<leader>gb", "<cmd>BlameToggle virtual<cr>", desc = "Git Blame (virtual mode)" },
      { "<leader>gB", "<cmd>BlameToggle window<cr>", desc = "Git Blame (window mode)" },
    },
    config = function()
      require("blame").setup({})
    end,
  },

  -- adds blame details to current line, copy file address, etc
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gor", "<cmd>GitBlameOpenFileURL<cr>", desc = "Open Remote @ main" },
      { "<leader>goc", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open Commit Changing Line" },
    },
    config = function()
      require("gitblame").setup({
        enabled = false,
      })
    end,
  },
}

return {
  "declancm/maximize.nvim",
  keys = {
    {
      "<leader>wm",
      function()
        require("maximize").toggle()
      end,
      desc = "Toggle maximize windows",
    },
  },
  config = function()
    require("maximize").setup()
  end,
}

return{
  "catppuccin/nvim",
  laze = false,
  name = "catpuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}

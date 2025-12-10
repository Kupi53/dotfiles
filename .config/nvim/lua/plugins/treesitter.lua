return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"java", "lua", "c", "cpp", "c_sharp", "python" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

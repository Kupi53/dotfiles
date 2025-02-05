return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		-- local diagnostics = null_ls.builtins.diagnostics -- to setup diagnostics

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"clang-format",
				"black",
				"isort",
				"ruff",
			},
			automatic_installation = true,
		})

    null_ls.setup({
      sources = {
        formatting.stylua,
        formatting.clang_format,
        formatting.black,
        formatting.isort,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {desc = "auto format"})
  end,
}

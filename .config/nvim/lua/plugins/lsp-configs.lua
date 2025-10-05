return{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      -- 🩹 FIX diagnostic display
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●',
          spacing = 2,
          source = "if_many",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Optional: Prettier signs in gutter
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- local lspconfig = require("lspconfig")
      vim.lsp.config('lua_ls', {capabilities = capabilities})
      vim.lsp.config('clangd', {capabilities = capabilities})
      vim.lsp.config('pyright', {capabilities = capabilities})
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('clangd')
      vim.lsp.enable('pyright')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('K', vim.lsp.buf.hover, '')
          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        end
      })
    end
  }
}

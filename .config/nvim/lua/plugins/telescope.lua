return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',  -- Enable hidden files search
            '--glob', '!.git/*'  -- Exclude .git directory
          },
          mappings = {
            i = {
              ['<c-k>'] = require("telescope.actions").move_selection_previous,
              ['<c-j>'] = require("telescope.actions").move_selection_next,
              ['<c-l>'] = require("telescope.actions").select_default,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,  -- Ensure find_files shows hidden files
            no_ignore = true, -- Optional: Show files ignored by .gitignore
            follow = true, -- Follow symbolic links
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      })

      -- Load extensions
      telescope.load_extension("ui-select")

      -- Keybindings
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, { desc = "Find files (including dotfiles)" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep ,  { desc = 'Telescope live grep'  })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  }
}


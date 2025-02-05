return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'moll/vim-bbye',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('bufferline').setup {
            options = {
                mode = 'buffers', -- set to "tabs" to only show tabpages instead
                themable = true, -- allows highlight groups to be overridden
                numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
                buffer_close_icon = '✗',
                close_icon = '✗',
                path_components = 1, -- Show only the file name without the directory
                modified_icon = '●',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 30,
                max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
                tab_size = 21,
                diagnostics = false,
                diagnostics_update_in_insert = false,
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = false,  -- Do not show close icon by default
                show_close_icon = true,  -- Do not show close icon by default
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                separator_style =  { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
                enforce_regular_tabs = true,
                always_show_bufferline = true,
                show_tab_indicators = false,
                indicator = {
                    style = 'none', -- Options: 'icon', 'underline', 'none'
                },
                icon_pinned = '󰐃',
                minimum_padding = 0,
                maximum_padding = 5,
                maximum_length = 15,
                sort_by = 'insert_at_end',
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                        highlight = "Directory",
                    }
                },
                hover = {
                    enabled = true,  -- Enable hover feature
                    delay = 1,     -- Delay before the close icon becomes visible
                    reveal = { 'close' },  -- Reveal only the close button on hover
                },
            },
            highlights = {
                -- This section can be customized further if needed
                separator = {
                    fg = '#e600ff',
                },
                buffer_selected = {
                    bold = true,
                    italic = false,
                },
            },

        }
    end,
}


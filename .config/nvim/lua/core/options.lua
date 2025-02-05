vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.o.mouse = "a" -- Enables mouse in all modes
vim.o.mousemoveevent = true -- Enable mousemove event handling
vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.smartcase = true

vim.opt.termguicolors = true -- For bufferline plugin to work properly

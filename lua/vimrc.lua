vim.cmd("set nocompatible")
vim.cmd("syntax on")

vim.cmd("filetype plugin indent on")
vim.cmd("set ruler")

vim.g.mapleader = " "

vim.opt.number = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.showmode = true
vim.opt.mouse = ""
vim.opt.scrolloff = 15
vim.opt.smoothscroll = true
vim.opt.termguicolors = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

vim.opt.wildignore:append({ "*/node_modules/*" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { noremap = true })

-- some phrase

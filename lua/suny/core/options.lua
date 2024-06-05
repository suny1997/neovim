-- shift+5(%) 在当前目录建立一个文件
-- :Explore 唤出目录

-- vim打开目录时,有竖线显示
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
-- 相对行号
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs(prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- 启用自动换行
opt.wrap = true
-- 使用linebreak选项来确保在单词边界处进行换行，而不是在字符中间换行
opt.linebreak = true
-- 显示换行符号
opt.showbreak = "↪"

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search,assume you want to case-sensitive

-- 显示光标所在行
opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent,end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

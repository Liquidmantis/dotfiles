-- global settings
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.undofile = true
vim.g.nobackup = true
vim.g.nowritebackup = true

vim.o.cmdheight = 2

vim.o.completeopt = 'menuone,noselect'

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime=50
-- set shortmess+=c " Don't pass messages to |ins-completion-menu|.

vim.api.nvim_command([[ autocmd VimResized * :wincmd = ]])
vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true                        -- highlight active line
vim.o.colorcolumn = '80'                       -- set EOL indicator
vim.o.signcolumn = 'yes'                       -- make gutter persistent
vim.o.showmode = false                         -- mode display now on status line

vim.o.tabstop = 2 
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 9
-- vim.o.showmatch = true                     -- flash matching brackets
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.scrolloff = 8


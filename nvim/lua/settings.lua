-- global settings
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.undofile = true
vim.g.nobackup = true
vim.g.nowritebackup = true

-- vim.api.nvim_command([[
-- augroup my-glyph-palette
--   autocmd! *
--   autocmd FileType fern call glyph_palette#apply()
--   autocmd FileType nerdtree,startify call glyph_palette#apply()
-- augroup END
-- ]])

vim.g.nvim_tree_auto_open = 1
-- settings for project.nvim integration
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_respect_buf_cwd = 1
-- end project.nvim


-- filetype plugin indent on
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- adjust vim-commentary standard comment style
-- vim.api.nvim_command([[ autocmd FileType Powershell setlocal commentstring=#\ %s ]])
-- vim.api.nvim_command([[ autocmd FileType tf setlocal commentstring=#\ %s ]])

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
vim.o.showmode = false                         -- replaced with status line

vim.o.tabstop = 2 
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- vim.o.foldmethod = indent                      -- default manual fold is painful
-- leaving the below fold settings, but it's not working yet.
vim.o.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 9
-- vim.o.showmatch = true                     -- flash matching brackets
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.scrolloff = 8

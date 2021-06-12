-- global settings
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.undodir = '~/.vim/undodir'
vim.o.undofile = true
vim.g.noswapfile = true
vim.o.nobackup = true
vim.o.nowritebackup = true

vim.g.fern.renderer = "nerdfont"

vim.api.nvim_command([[
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
]])


-- filetype plugin indent on
vim.g.mapleader = " "

-- adjust vim-commentary standard comment style
vim.api.nvim_command([[ autocmd FileType Powershell setlocal commentstring=#\ %s ]])
vim.api.nvim_command([[ autocmd FileType tf setlocal commentstring=#\ %s ]])

--  Airline Settings
vim.o.showtabline = 2
vim.o.noshowmode = true                   -- remove default mode indicators

vim.o.cmdheight = 2

vim.o.completeopt = menuone,longest
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
--  delays and poor user experience.
vim.o.updatetime=50
-- set shortmess+=c " Don't pass messages to |ins-completion-menu|.

vim.api.nvim_command([[ autocmd VimResized * :wincmd = ]])
vim.g.colorscheme = gruvbox
vim.o.background = dark
vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true                         -- highlight active line
vim.o.colorcolumn = 80
    -- highlight ColorColumn ctermbg=0 guibg=Green
vim.o.signcolumn = yes

vim.o.tabstop = 2 
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.foldmethod = indent                  -- default manual fold is painful
vim.o.foldlevel = 9
vim.o.showmatch = true                     -- flash matching brackets
vim.o.incsearch = true                 
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.scrolloff = true

vim.o.syntax = on

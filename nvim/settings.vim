" global settings
set undodir=~/.vim/undodir
set undofile

filetype on

" adjust vim-commentary standard comment style
autocmd FileType Powershell setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s

colorscheme gruvbox
set background=dark

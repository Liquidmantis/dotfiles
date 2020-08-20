" TODO: organize these into something sensible
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>- :split<CR>
nnoremap <silent> <leader>\ :vsplit<CR>
nnoremap <silent> <leader>! :wincmd _<CR>:wincmd \|<CR> " break buffer to new window
nnoremap <silent> <leader>= :wincmd =<CR>
" nnoremap <leader>bb :ls<cr>:b<space>
nnoremap <leader>bv :ls<cr>:vert sb<space>
nnoremap <leader>bs :ls<cr>:sb<space>
nnoremap <silent> <leader>ej :CocCommand explorer<CR> " trying a faster mapping - 'j' for left side
nnoremap <silent> <leader>ef :CocCommand explorer --preset floating<CR>
nnoremap <silent> <leader>viv :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>sov :source $MYVIMRC<CR> | echo 'Reloaded neovim config.'
nnoremap <silent> <leader>hl :noh<CR> " clear last search highlight
nnoremap <tab> gt
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" fzf bindings
map <C-f> :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


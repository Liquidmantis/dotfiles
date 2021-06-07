" window control movement commands
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>- :split<CR>
nnoremap <silent> <leader>\ :vsplit<CR>
nnoremap <silent> <leader>! :wincmd _<CR>:wincmd \|<CR> " break buffer to new window
nnoremap <silent> <leader>= :wincmd =<CR>
nnoremap <silent> <leader>q :q<CR>
" nnoremap <leader>bb :ls<cr>:b<space>
" nnoremap <leader>bv :ls<cr>:vert sb<space>
" nnoremap <leader>bs :ls<cr>:sb<space>

" Fern mappings
nnoremap <leader>ee <cmd>Fern .<CR>
noremap <silent> <Leader>d :Fern . -drawer -width=35 -toggle<CR><C-w>=
noremap <silent> <Leader>ef :Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=
noremap <silent> <Leader>. :Fern %:h -drawer -width=35 -toggle<CR><C-w>=

" Lspsaga bindings
nnoremap <silent> <Leader>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>ft <cmd>Telescope file_browser<CR>
nnoremap <leader>ts <cmd>Telescope treesitter<CR>
nnoremap <leader>fs <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fq <cmd>Telescope quickfix<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fc <cmd>Telescope commands<CR>
nnoremap <leader>f: <cmd>Telescope command_history<CR>
nnoremap <leader>fm <cmd>Telescope marks<CR>
nnoremap <leader>fk <cmd>Telescope keymaps<CR>
nnoremap <leader>fr <cmd>Telescope registers<CR>

nnoremap <leader>fgc <cmd>Telescope git_commits<CR>
nnoremap <leader>fgb <cmd>Telescope git_branches<CR>
nnoremap <leader>fgt <cmd>Telescope git_bcommits<CR>
nnoremap <leader>fgs <cmd>Telescope git_status<CR>

nnoremap <leader>ns <cmd>lua require('telescope-config').find_notes()<CR>
nnoremap <leader>ng <cmd>lua require('telescope-config').grep_notes()<CR>

" PowerShell mappings
nnoremap <silent> <leader>pst :CocCommand powershell.toggleTerminal<CR>
nnoremap <silent> <leader>psl :CocCommand powershell.evaluateLine<CR>
nnoremap <silent> <leader>pss :CocCommand powershell.evaluateSelection<CR>
nnoremap <silent> <leader>pse :CocCommand powershell.execute<CR>

nnoremap <silent> <leader>viv :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>sov :source $MYVIMRC<CR> | echo 'Reloaded neovim config.'
nnoremap <silent> <leader>hl :noh<CR> " clear last search highlight
nnoremap <silent> <tab> :bn<CR>         " buffer next
nnoremap <silent> <S-tab> :bp<CR>       " buffer prev
nnoremap <silent> <leader>bd :bd<CR>    " buffer destroy
nnoremap <silent> <leader>bn :bn<CR>    " buffer next
nnoremap <silent> <leader>bp :bp<CR>    " buffer prev
nnoremap <silent> <leader><tab> gt
nnoremap <silent> <leader><S-tab> gT
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Floaterm bindings
nnoremap <silent> <C-T> :FloatermToggle<CR>
tnoremap <silent> <C-T> <C-\><C-n>:FloatermToggle<CR>

" fzf bindings
map <C-f> :Files<CR>
nnoremap <leader><leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

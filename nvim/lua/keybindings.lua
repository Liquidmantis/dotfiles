local remap = vim.api.nvim_set_keymap

remap('n', '<leader>h',  ':wincmd h<CR>', {noremap = true, silent = true})
remap('n', '<leader>l',  ':wincmd l<CR>', {noremap = true, silent = true})
remap('n', '<leader>j',  ':wincmd j<CR>', {noremap = true, silent = true})
remap('n', '<leader>k',  ':wincmd k<CR>', {noremap = true, silent = true})
remap('n', '<leader>-',  ':split<CR>',    {noremap = true, silent = true})
remap('n', '<leader>\\', ':vsplit<CR>',   {noremap = true, silent = true})
remap('n', '<leader>sh', ':split<CR>',    {noremap = true, silent = true})
remap('n', '<leader>sv', ':vsplit<CR>',   {noremap = true, silent = true})

-- hop motions
remap('n', '<leader><leader>w', ':HopWord<CR>',  {noremap = true, silent = true})
remap('n', '<leader><leader>j', ':HopLine<CR>',  {noremap = true, silent = true})
remap('n', '<localleader>w',    ':HopWord<CR>',  {noremap = true, silent = true})
remap('n', '<localleader>j',    ':HopLine<CR>',  {noremap = true, silent = true})
remap('n', '<localleader>c',    ':HopChar1<CR>', {noremap = true, silent = true})
remap('n', '<localleader>s',    ':HopChar2<CR>', {noremap = true, silent = true})
remap('n', '<localleader><localleader>', ':HopPattern<CR>', {noremap = true, silent = true})


-- toggles
remap('n', '<leader>tt', ':set relativenumber!<CR>', {noremap = true, silent = true})
remap('n', '<leader>tw', ':set list!<CR>',           {noremap = true, silent = true})

-- Nvim Tree mappings
remap('n', '<leader>ej', ':NvimTreeToggle<CR>',   {noremap = true, silent = true})
remap('n', '<leader>.',  ':NvimTreeFindFile<CR>', {noremap = true, silent = true})


vim.cmd([[
" window control movement commands
nnoremap <silent> <leader>! :wincmd _<CR>:wincmd \|<CR> " break buffer to new window
nnoremap <silent> <leader>= :wincmd =<CR>
nnoremap <silent> <leader>q :q<CR>
" nnoremap <leader>bb :ls<cr>:b<space>
" nnoremap <leader>bv :ls<cr>:vert sb<space>
" nnoremap <leader>bs :ls<cr>:sb<space>

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


" Lspsaga bindings
nnoremap <silent> <Leader>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>



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


" Floaterm bindings
nnoremap <silent> <C-T> :FloatermToggle<CR>
tnoremap <silent> <C-T> <C-\><C-n>:FloatermToggle<CR>


" fzf bindings
map <C-f> :Files<CR>
nnoremap <leader><leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
]])

-- stolen from https://github.com/ibhagwan/nvim-lua/blob/main/lua/keymaps.lua
-- Map <leader>o & <leader>O to newline without insert mode
remap('n', '<leader>o',
    ':<C-u>call append(line("."), repeat([""], v:count1))<CR>',
    { noremap = true, silent = true })
remap('n', '<leader>O',
    ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>',
    { noremap = true, silent = true })

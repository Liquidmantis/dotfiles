local remap = vim.api.nvim_set_keymap
local opts =  {noremap = true, silent = true}
local eopts = {noremap = true, silent = true, expr = true}

-- quality of live mappings
remap('n', 'Y', 'y$',  opts)
remap('n', 'n', 'nzz', opts)
remap('n', 'N', 'Nzz', opts)
-- extend undo checkpoints
remap('i', ',', ',<C-g>u', opts)
remap('i', '.', '.<C-g>u', opts)
remap('i', '!', '!<C-g>u', opts)
remap('i', '?', '?<C-g>u', opts)
-- extend jumplist add triggers
remap('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', eopts)
remap('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', eopts)
-- move lines up and down
remap('v', 'J',     ':m \'>+1<CR>gv=gv', opts)
remap('v', 'K',     ':m \'<-2<CR>gv=gv', opts)
remap('i', '<C-j>', '<esc>:m .+1<CR>==', opts)
remap('i', '<C-k>', '<esc>:m .+2<CR>==', opts)
remap('n', '<leader>j', ':m .+1<CR>==',  opts)
remap('n', '<leader>k', ':m .-2<CR>==',  opts)

-- window control commands
remap('n', '<leader>!',  ':wincmd |<CR>', opts)
remap('n', '<leader>=',  ':wincmd =<CR>', opts)
remap('n', '<leader>q',  ':q<CR>',        opts)
remap('n', '<leader>-',  ':split<CR>',    opts)
remap('n', '<leader>\\', ':vsplit<CR>',   opts)
remap('n', '<leader>sh', ':split<CR>',    opts)
remap('n', '<leader>sv', ':vsplit<CR>',   opts)

-- window movement commands
remap('t', '<C-h>',  '<C-\\><C-n>:wincmd h<CR>', opts)
remap('t', '<C-l>',  '<C-\\><C-n>:wincmd l<CR>', opts)
remap('t', '<C-j>',  '<C-\\><C-n>:wincmd j<CR>', opts)
remap('t', '<C-k>',  '<C-\\><C-n>:wincmd k<CR>', opts)

remap('n', '<C-T>', ':ToggleTerm<CR>',            opts)
remap('t', '<C-T>', '<C-\\><C-n>:ToggleTerm<CR>', opts)

remap('n', '<leader>m', ':MaximizerToggle<CR>', opts)
remap('t', '<C-e>',     '<C-\\><C-n>',          opts)

remap('n', '<leader><leader>m', ':MinimapToggle<CR>', opts)

-- fugitive commands
remap('n', '<localleader>gs', ':G<CR>',        opts)
remap('n', '<localleader>gc', ':G commit<CR>', opts)
remap('n', '<localleader>gp', ':G push<CR>',   opts)
remap('n', '<localleader>gl', ':G log<CR>',    opts)
remap('n', '<localleader>gd', ':G diff<CR>',   opts)
remap('n', '<localleader>gb', ':G blame<CR>',  opts)

-- hop motions
remap('n', '<leader><leader>w', ':HopWordAC<CR>',  opts)
remap('n', '<leader><leader>b', ':HopWordBC<CR>',  opts)
remap('n', '<leader><leader>j', ':HopLineAC<CR>',  opts)
remap('n', '<leader><leader>k', ':HopLineBC<CR>',  opts)
remap('n', '<localleader>w',    ':HopWordAC<CR>',  opts)
remap('n', '<localleader>b',    ':HopWordBC<CR>',  opts)
remap('n', '<localleader>j',    ':HopLineAC<CR>',  opts)
remap('n', '<localleader>k',    ':HopLineBC<CR>',  opts)
remap('n', '<localleader>f',    ':HopChar1AC<CR>', opts)
remap('n', '<localleader>F',    ':HopChar1BC<CR>', opts)
remap('n', '<localleader>s',    ':HopChar2AC<CR>', opts)
remap('n', '<localleader>S',    ':HopChar2BC<CR>', opts)
remap('n', '<localleader><localleader>', ':HopPattern<CR>', opts)

-- gitsigns commands
-- prefix logic is "[g]it [g]utter [c]ommand to use 'gg' namespace and not add
-- delay to the gs command.  Revisit if lspsaga sig binding changes.
remap('n', '<leader>ggl', ':Gitsigns toggle_current_line_blame<CR>', opts)
remap('n', '<leader>ggw', ':Gitsigns toggle_current_word_diff<CR>', opts)


-- lspsaga commands
remap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>',                 opts)
remap('n', 'gr', '<cmd>lua require("lspsaga.rename").rename()<CR>',                       opts)
remap('n', 'gd', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>',         opts)
remap('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',        opts)
remap('n', 'cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>',    opts)
remap('n', 'cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>',  opts)
remap('n', '[e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
remap('n', ']e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)
remap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>',      opts)
remap('n', '<leader>k',  '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>',      opts)

-- vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
remap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',  opts)
remap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

-- [c]uickfix commands
remap('n', '<leader>co', ':copen<CR>',  opts)
remap('n', '<leader>cc', ':cclose<CR>', opts)
remap('n', '<leader>cn', ':cnext<CR>',  opts)
remap('n', '<leader>cp', ':cprev<CR>',  opts)
remap('n', '<leader>cf', ':cfdo ',      opts)

-- toggles
remap('n', '<leader>tt', ':set relativenumber!<CR>',   opts)
remap('n', '<leader>tw', ':set list!<CR>',             opts)
remap('n', '<leader>ti', ':IndentBlanklineToggle<CR>', opts)

-- Nvim Tree mappings
remap('n', '<leader>.', ':NvimTreeToggle<CR>',  opts)

-- Telescope mappings
remap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<CR>', opts)
remap('n', '<leader>fs', '<cmd>Telescope live_grep<CR>',    opts)
remap('n', '<leader>ft', '<cmd>Telescope file_browser<CR>', opts)
remap('n', '<leader>fp', '<cmd>Telescope projects<CR>', opts)
vim.cmd([[
nnoremap <leader>ts <cmd>Telescope treesitter<CR>
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

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]])

-- TODO: GET THESE CONVERTED
vim.cmd([[
" nnoremap <leader>bb :ls<cr>:b<space>
" nnoremap <leader>bv :ls<cr>:vert sb<space>
" nnoremap <leader>bs :ls<cr>:sb<space>

nnoremap <silent> <leader>viv :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>sov :source $MYVIMRC<CR> | echo 'Reloaded neovim config.'
nnoremap <silent> <leader>hl :noh<CR> " clear last search highlight
nnoremap <silent> <tab> :bn<CR>         " buffer next
nnoremap <silent> <S-tab> :bp<CR>       " buffer prev
nnoremap <silent> <leader>bc :Bdelete<CR>    " buffer close using BufDelete plugin
nnoremap <silent> <leader>bn :bn<CR>    " buffer next
nnoremap <silent> <leader>bp :bp<CR>    " buffer prev
nnoremap <silent> <leader><tab> gt
nnoremap <silent> <leader><S-tab> gT
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Telescope mappings
" defaults: https://github.com/nvim-telescope/telescope.nvim/blob/618e0e6075b4215e43c6a848daa37ef4e354b5dc/lua/telescope/mappings.lua

nnoremap <leader>ns <cmd>lua require('telescope-config').find_notes()<CR>
nnoremap <leader>ng <cmd>lua require('telescope-config').grep_notes()<CR>


" PowerShell mappings
nnoremap <silent> <leader>pst :CocCommand powershell.toggleTerminal<CR>
nnoremap <silent> <leader>psl :CocCommand powershell.evaluateLine<CR>
nnoremap <silent> <leader>pss :CocCommand powershell.evaluateSelection<CR>
nnoremap <silent> <leader>pse :CocCommand powershell.execute<CR>

]])

-- stolen from https://github.com/ibhagwan/nvim-lua/blob/main/lua/keymaps.lua
-- Map <leader>o & <leader>O to newline without insert mode
remap('n', '<leader>o',
    ':<C-u>call append(line("."), repeat([""], v:count1))<CR>',
    { noremap = true, silent = true })
remap('n', '<leader>O',
    ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>',
    { noremap = true, silent = true })

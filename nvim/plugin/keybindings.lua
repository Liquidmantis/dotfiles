local remap = vim.api.nvim_set_keymap
local opts =  {noremap = true, silent = true}
local eopts = {noremap = true, silent = true, expr = true}

local function nnoremap( lhs, rhs )
  remap('n', lhs, rhs, opts)
end

local function inoremap( lhs, rhs )
  remap('i', lhs, rhs, opts)
end

local function vnoremap( lhs, rhs )
  remap('v', lhs, rhs, opts)
end

local function tnoremap( lhs, rhs )
  remap('t', lhs, rhs, opts)
end

nnoremap( '<leader>viv', ':tabedit $MYVIMRC<CR>' )
-- TODO. make this work with lua-based config
nnoremap( '<leader>sov', ':source $MYVIMRC<CR> | echo "Reloaded neovim config."' )
-- quality of life mappings
nnoremap( 'Y', 'y$'  ) -- make Y act like other capital, rest of line ops.
nnoremap( 'n', 'nzz' ) -- find next and recenter
nnoremap( 'N', 'Nzz' ) -- find prev and recenter
-- stolen from https://github.com/ibhagwan/nvim-lua/blob/main/lua/keymaps.lua
-- Map <leader>o & <leader>O to newline without insert mode
nnoremap( '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>' )
nnoremap( '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>' )

-- extend undo checkpoints
inoremap( ',', ',<C-g>u' )
inoremap( '.', '.<C-g>u' )
inoremap( ';', '.<C-g>u' )
inoremap( ':', ':<C-g>u' )
inoremap( '!', '!<C-g>u' )
inoremap( '?', '?<C-g>u' )
-- extend jumplist add triggers
remap('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', eopts)
remap('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', eopts)
-- move lines up and down
vnoremap( 'J',     ':m \'>+1<CR>gv=gv' )
vnoremap( 'K',     ':m \'<-2<CR>gv=gv' )
inoremap( '<C-j>', '<esc>:m .+1<CR>==' )
inoremap( '<C-k>', '<esc>:m .+2<CR>==' )
nnoremap( '<leader>j', ':m .+1<CR>=='  )
nnoremap( '<leader>k', ':m .-2<CR>=='  )

-- buffer and tab commands
nnoremap( '<C-tab>', ':buf #<CR>' ) -- flip to alternate file
nnoremap( '<localleader><tab>', ':bn<CR>' )           -- buffer next
nnoremap( '<S-tab>', ':bp<CR>' )         -- buffer prev
nnoremap( '<localleader>q', ':Bdelete<CR>' ) -- buffer close using BufDelete plugin
nnoremap( '<leader><tab>', 'gt' )
nnoremap( '<leader><S-tab>', 'gT' )

-- window control commands
nnoremap( '<leader>!',  ':wincmd |<CR>' )  -- make a window as large as possible
nnoremap( '<leader>=',  ':wincmd =<CR>' )  -- rebalance windows
nnoremap( '<leader>q',  ':q<CR>'        )  -- close window
nnoremap( '<leader>-',  ':split<CR>'    )
nnoremap( '<leader>\\', ':vsplit<CR>'   )
nnoremap( '<leader>sh', ':split<CR>'    )
nnoremap( '<leader>sv', ':vsplit<CR>'   )
nnoremap( '<leader>m', ':MaximizerToggle<CR>' )

-- harpoon mappings
nnoremap( '<leader>hc', ':lua require("harpoon.ui").toggle_quick_menu()<CR>' )
nnoremap( '<leader>hh', ':lua require("harpoon.mark").add_file()<CR>' )
nnoremap( '<leader>ha', ':lua require("harpoon.ui").nav_file(1)<CR>'  )
nnoremap( '<leader>hs', ':lua require("harpoon.ui").nav_file(2)<CR>'  )
nnoremap( '<leader>hd', ':lua require("harpoon.ui").nav_file(3)<CR>'  )
nnoremap( '<leader>hf', ':lua require("harpoon.ui").nav_file(4)<CR>'  )

-- window movement commands
tnoremap( '<C-h>',  '<C-\\><C-n>:wincmd h<CR>' )
tnoremap( '<C-l>',  '<C-\\><C-n>:wincmd l<CR>' )
tnoremap( '<C-j>',  '<C-\\><C-n>:wincmd j<CR>' )
tnoremap( '<C-k>',  '<C-\\><C-n>:wincmd k<CR>' )

-- terminal goodies
nnoremap( '<C-T>', ':ToggleTerm<CR>'            )
tnoremap( '<C-T>', '<C-\\><C-n>:ToggleTerm<CR>' )
tnoremap( '<C-e>',     '<C-\\><C-n>'            )

-- fugitive commands
nnoremap( '<localleader>gs', ':G<CR>'        )
nnoremap( '<localleader>gc', ':G commit<CR>' )
nnoremap( '<localleader>gp', ':G push<CR>'   )
nnoremap( '<localleader>gl', ':G log<CR>'    )
nnoremap( '<localleader>gd', ':G diff<CR>'   )
nnoremap( '<localleader>gb', ':G blame<CR>'  )

-- hop motions
nnoremap( '<leader><leader>w', ':HopWordAC<CR>'  )
nnoremap( '<leader><leader>b', ':HopWordBC<CR>'  )
nnoremap( '<leader><leader>j', ':HopLineAC<CR>'  )
nnoremap( '<leader><leader>k', ':HopLineBC<CR>'  )
nnoremap( '<localleader>w',    ':HopWordAC<CR>'  )
nnoremap( '<localleader>b',    ':HopWordBC<CR>'  )
nnoremap( '<localleader>j',    ':HopLineAC<CR>'  )
nnoremap( '<localleader>k',    ':HopLineBC<CR>'  )
nnoremap( '<localleader>f',    ':HopChar1AC<CR>' )
nnoremap( '<localleader>F',    ':HopChar1BC<CR>' )
nnoremap( '<localleader>s',    ':HopChar2AC<CR>' )
nnoremap( '<localleader>S',    ':HopChar2BC<CR>' )
nnoremap( '<localleader><localleader>', ':HopPattern<CR>' )

-- gitsigns commands
-- prefix logic is "[g]it [g]utter [c]ommand to use 'gg' namespace and not add
-- delay to the gs command.  Revisit if lspsaga sig binding changes.
nnoremap( '<leader>ggl', ':Gitsigns toggle_current_line_blame<CR>' )
nnoremap( '<leader>ggw', ':Gitsigns toggle_current_word_diff<CR>'  )
nnoremap( '<leader>ggh', ':Gitsigns toggle_hunk<CR>'  )


-- lspsaga commands
-- remap('n', 'gh', ':lua require("lspsaga.provider").lsp_finder()<CR>',                 opts)
-- remap('n', 'gr', ':lua require("lspsaga.rename").rename()<CR>',                       opts)
-- remap('n', 'gd', ':lua require("lspsaga.provider").preview_definition()<CR>',         opts)
-- remap('n', 'gs', ':lua require("lspsaga.signaturehelp").signature_help()<CR>',        opts)
-- remap('n', 'cd', ':lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>',    opts)
-- remap('n', 'cc', ':lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>',  opts)
-- remap('n', '[e', ':lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
-- remap('n', ']e', ':lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)
-- remap('n', '<leader>ca', ':lua require("lspsaga.codeaction").code_action()<CR>',      opts)
-- remap('n', '<leader>k',  ':lua require("lspsaga.hover").render_hover_doc()<CR>',      opts)

-- vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
-- remap('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',  opts)
-- remap('n', '<C-b>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

-- [c]uickfix commands (quickfix)
nnoremap( '<leader>co', ':copen<CR>'  )
nnoremap( '<leader>cc', ':cclose<CR>' )
nnoremap( '<leader>cn', ':cnext<CR>'  )
nnoremap( '<leader>cp', ':cprev<CR>'  )
nnoremap( '<leader>cf', ':cfdo '      )

-- view toggles
nnoremap( '<leader>tt', ':set relativenumber!<CR>'   )
nnoremap( '<leader>tw', ':set list!<CR>'             )
nnoremap( '<leader>ti', ':IndentBlanklineToggle<CR>' )
nnoremap( '<leader>tm', ':MinimapToggle<CR>'         )
nnoremap( '<leader>hl', ':noh<CR>' ) -- clear last search highlight

-- Nvim Tree mappings
nnoremap( '<leader>.', ':NvimTreeToggle<CR>' )
nnoremap( '<leader>u', ':UndotreeToggle<CR>')

-- Telescope mappings
-- defaults: https://github.com/nvim-telescope/telescope.nvim/blob/618e0e6075b4215e43c6a848daa37ef4e354b5dc/lua/telescope/mappings.lua
nnoremap( '<leader>ff', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>' )
nnoremap( '<leader>fs', ':Telescope live_grep<CR>'    )
nnoremap( '<leader>ft', ':Telescope file_browser<CR>' )
nnoremap( '<leader>fp', ':Telescope projects<CR>'     )
nnoremap( '<leader>fu', ':Telescope lsp_references<CR>'  )
nnoremap( '<leader>gd', ':Telescope lsp_definitions<CR>' )
nnoremap( '<leader>dd', ':Telescope lsp_document_diagnostics<CR>' )
nnoremap( '<leader>dD', ':Telescope lsp_workspace_diagnostics<CR>' )
nnoremap( '<leader>xx', ':Telescope lsp_code_actions<CR>' )
nnoremap( '<leader>xd', ':Telescope lsp_range_code_actions<CR>' )
nnoremap( '<leader>rn', ':lua vim.lsp.buf.rename()<CR>'  )
nnoremap( '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>' )
nnoremap( '<leader>dN', ':lua vim.lsp.diagnostic.goto_prev()<CR>' )
nnoremap( '<leader>ts', ':Telescope treesitter<CR>' )
nnoremap( '<leader>fb', ':Telescope buffers<CR>' )
nnoremap( '<leader>fq', ':Telescope quickfix<CR>' )
nnoremap( '<leader>fh', ':Telescope help_tags<CR>' )
nnoremap( '<leader>fc', ':Telescope commands<CR>' )
nnoremap( '<leader>f:', ':Telescope command_history<CR>' )
nnoremap( '<leader>fm', ':Telescope marks<CR>' )
nnoremap( '<leader>fk', ':Telescope keymaps<CR>' )
nnoremap( '<leader>fr', ':Telescope registers<CR>' )
-- Telescope git
nnoremap( '<leader>fgc', ':Telescope git_commits<CR>' )
nnoremap( '<leader>fgb', ':Telescope git_branches<CR>' )
nnoremap( '<leader>fgt', ':Telescope git_bcommits<CR>' )
nnoremap( '<leader>fgs', ':Telescope git_status<CR>' )
-- Telescope notes custom
nnoremap( '<leader>nf', ":lua require('telescope-config').find_notes()<CR>" )
nnoremap( '<leader>ns', ":lua require('telescope-config').grep_notes()<CR>" )


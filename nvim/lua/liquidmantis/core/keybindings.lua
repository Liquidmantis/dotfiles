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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
inoremap( ';', ';<C-g>u' )
inoremap( ':', ':<C-g>u' )
inoremap( '!', '!<C-g>u' )
inoremap( '?', '?<C-g>u' )
-- extend jumplist add triggers
remap('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', eopts)
remap('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', eopts)
-- move lines up and down
vnoremap( 'J', ':m \'>+1<CR>gv=gv' )
vnoremap( 'K', ':m \'<-2<CR>gv=gv' )
inoremap( '∆', '<esc>:m .+1<CR>==i' )           -- map Alt-J to move line down
inoremap( '˚', '<esc>:m .-2<CR>==i' )           -- map Alt-K to move line up
nnoremap( '∆', ':m .+1<CR>=='  )                -- map Alt-J to move line down
nnoremap( '˚', ':m .-2<CR>=='  )                -- map Alt-K to move line up

-- buffer and tab commands
nnoremap( '<tab>', ':buf #<CR>' ) -- flip to alternate file
nnoremap( '<M-tab>', ':bn<CR>' )           -- buffer next
nnoremap( '<M-S-tab>', ':bp<CR>' )         -- buffer prev
nnoremap( '<localleader>q', ':Bdelete<CR>' ) -- buffer close using BufDelete plugin
nnoremap( '<leader><tab>', 'gt' )
nnoremap( '<leader><S-tab>', 'gT' )
nnoremap( '<localleader>sf', '<cmd>source %<CR> | <cmd>lua vim.notify("Reloaded " .. vim.fn.expand(\'%\'))<CR>' )

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
nnoremap( '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>' )
nnoremap( '<leader>he', ':lua require("harpoon.mark").add_file()<CR>:lua print(string.format("Added %s to Harpoon list", vim.api.nvim_buf_get_name(0)))<CR>' )
nnoremap( '<leader>hn', ':lua require("harpoon.ui").nav_next()<CR>' )
nnoremap( '<leader>hp', ':lua require("harpoon.ui").nav_prev()<CR>' )
nnoremap( '<leader>ha', ':lua require("harpoon.ui").nav_file(1)<CR>'  )
nnoremap( '<leader>hs', ':lua require("harpoon.ui").nav_file(2)<CR>'  )
nnoremap( '<leader>hd', ':lua require("harpoon.ui").nav_file(3)<CR>'  )
nnoremap( '<leader>hf', ':lua require("harpoon.ui").nav_file(4)<CR>'  )

-- zk mappings
nnoremap( '<leader>zb', ':ZkBacklinks<CR>' )
nnoremap( '<leader>zj', ':ZkToday<CR>' )
nnoremap( '<leader>zd', ':ZkDailies<CR>' )
nnoremap( '<leader>zl', ':ZkLinks<CR>' )
nnoremap( '<leader>zn', ':ZkNotes<CR>' )
nnoremap( '<leader>zr', ':ZkRecents<CR>' )
nnoremap( '<leader>zt', ':ZkTags<CR>' )
nnoremap( '<leader>zcn', ":ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>" )
nnoremap( '<leader>zct', ":ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>" )
nnoremap( '<leader>zcc', ":ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h') }<CR>" )

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

-- gitsigns commands
-- prefix logic is "[g]it [g]utter [c]ommand to use 'gg' namespace and not add
-- delay to the gs command.  Revisit if lspsaga sig binding changes.
nnoremap( '<leader>ggl', ':Gitsigns toggle_current_line_blame<CR>' )
nnoremap( '<leader>ggw', ':Gitsigns toggle_current_word_diff<CR>'  )
nnoremap( '<leader>gghh', ':Gitsigns preview_hunk<CR>' )
nnoremap( '<leader>gghn', ':Gitsigns next_hunk<CR>'  )
nnoremap( '<leader>gghp', ':Gitsigns prev_hunk<CR>'  )
nnoremap( '<leader>gghr', ':Gitsigns reset_hunk<CR>' )
nnoremap( '<leader>gghs', ':Gitsigns stage_hunk<CR>' )

nnoremap( '<CR>', ':lua vim.lsp.buf.definition()<CR>' )
nnoremap( 'gs', ':lua vim.lsp.buf.signature_help()<CR>' )

-- lspsaga commands
remap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>',               opts)
remap('n', 'gr', '<cmd>Lspsaga rename<CR>',                   opts)
remap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>',          opts)
-- remap('n', 'gs', '<cmd>Lspsaga signature_help<CR>',           opts)
remap('n', 'cd', '<cmd>Lspsaga show_line_diagnostics<CR>',    opts)
remap('n', 'cc', '<cmd>Lspsaga show_cursor_diagnostics<CR>',  opts)
remap('n', '[e', '<cmd>Lspsaga lsp_jump_diagnostic_prev<CR>', opts)
remap('n', ']e', '<cmd>Lspsaga lsp_jump_diagnostic_next<CR>', opts)
remap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>',      opts)
remap('n', 'K',  '<cmd>Lspsaga hover_doc<CR>',        opts)

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
nnoremap( '<localleader>tc', ':ColorizerToggle<CR>' )
nnoremap( '<localleader>ti', ':IndentBlanklineToggle<CR>' )
nnoremap( '<localleader>tm', ':MinimapToggle<CR>'         )
nnoremap( '<localleader>tt', ':set relativenumber!<CR>'   )
nnoremap( '<localleader>tw', ':set list!<CR>'             )
nnoremap( '<leader>hl', ':noh<CR>' ) -- clear last search highlight

-- Nvim Tree mappings
nnoremap( '<leader>.', ':NvimTreeToggle<CR>' )
-- nnoremap( '<leader>.', ':NeoTreeFocusToggle<CR>' )
nnoremap( '<leader>u', ':UndotreeToggle<CR>')

-- Treesitter Mappings
nnoremap( '<leader>tp', ':TSPlaygroundToggle<CR>')

-- Telescope mappings
-- defaults: https://github.com/nvim-telescope/telescope.nvim/blob/618e0e6075b4215e43c6a848daa37ef4e354b5dc/lua/telescope/mappings.lua
nnoremap( '<leader>ff', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>' )
nnoremap( '<leader>fs', ':Telescope live_grep<CR>'    )
nnoremap( '<leader>ft', ':Telescope file_browser<CR>' )
nnoremap( '<leader>fp', ':Telescope projects<CR>'     )
nnoremap( '<leader>fu', ':Telescope lsp_references<CR>'  )
nnoremap( '<leader>gd', ':Telescope lsp_definitions<CR>' )
nnoremap( '<leader>dd', ':Telescope diagnostics bufnr=0<CR>' )
nnoremap( '<leader>dD', ':Telescope diagnostics<CR>' )
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
nnoremap( '<leader>nf', ":lua require('lmantis.telescope-functions').find_notes()<CR>" )
nnoremap( '<leader>ns', ":lua require('lmantis.telescope-functions').grep_notes()<CR>" )
nnoremap( '<c-_>', "<cmd>lua require('lmantis.telescope-functions').search_in_buffer()<CR>" )


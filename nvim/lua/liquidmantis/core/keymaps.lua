local remap = vim.keymap.set
local opts = { noremap = true, silent = true }
local eopts = { noremap = true, silent = true, expr = true }

local function nnoremap(lhs, rhs)
  remap('n', lhs, rhs, opts)
end

local function inoremap(lhs, rhs)
  remap('i', lhs, rhs, opts)
end

local function vnoremap(lhs, rhs)
  remap('v', lhs, rhs, opts)
end

local function tnoremap(lhs, rhs)
  remap('t', lhs, rhs, opts)
end

nnoremap('<leader>viv', ':tabedit $MYVIMRC<CR>')
nnoremap('<leader>sok', ':source %:p:h/lua/liquidmantis/core/keymaps.lua<CR> | vim.notify "Reloaded keymaps."')

-- quality of life mappings
nnoremap('Y', 'y$')  -- make Y act like other capital, rest of line ops.
nnoremap('n', 'nzz') -- find next and recenter
nnoremap('N', 'Nzz') -- find prev and recenter
-- stolen from https://github.com/ibhagwan/nvim-lua/blob/main/lua/keymaps.lua
-- Map <leader>o & <leader>O to newline without insert mode
nnoremap('go', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>')
nnoremap('gO', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

-- extend undo checkpoints
inoremap(',', ',<C-g>u')
inoremap('.', '.<C-g>u')
inoremap(';', ';<C-g>u')
inoremap(':', ':<C-g>u')
inoremap('!', '!<C-g>u')
inoremap('?', '?<C-g>u')
-- extend jumplist add triggers
remap('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', eopts)
remap('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', eopts)

-- move lines up and down
vnoremap('J', ':m \'>+1<CR>gv=gv')
vnoremap('K', ':m \'<-2<CR>gv=gv')
-- the terminal catches alt keycodes, so these bindings use the resultant character
-- in order to map the command
inoremap('∆', '<esc>:m .+1<CR>==i') -- map Alt-J to move line down
inoremap('˚', '<esc>:m .-2<CR>==i') -- map Alt-K to move line up
nnoremap('∆', ':m .+1<CR>==') -- map Alt-J to move line down
nnoremap('˚', ':m .-2<CR>==') -- map Alt-K to move line up
-- Ghostty translates Opt to Alt by  default, so here are natural mappings for Ghostty
inoremap('<M-j>', ':m .+1<CR>==') -- map Alt-J to move line down
inoremap('<M-k>', ':m .-2<CR>==') -- map Alt-K to move line up
nnoremap('<M-j>', ':m .+1<CR>==') -- map Alt-J to move line down
nnoremap('<M-k>', ':m .-2<CR>==') -- map Alt-K to move line up
vnoremap('<M-j>', ':m .+1<CR>==') -- map Alt-J to move line down
vnoremap('<M-k>', ':m .-2<CR>==') -- map Alt-K to move line up

-- buffer and tab commands
nnoremap('<leader>bb', ':Telescope buffers<CR>')
nnoremap('<leader>bd', ':Bdelete<CR>')     -- buffer close using BufDelete plugin
nnoremap('<leader>bq', ':Bdelete<CR>')     -- buffer close using BufDelete plugin
nnoremap('<leader>bs', ':Telescope current_buffer_fuzzy_find<CR>')
nnoremap('<tab>', ':buf #<CR>')            -- flip to alternate file
nnoremap('<M-tab>', ':bn<CR>')             -- buffer next
nnoremap('<M-S-tab>', ':bp<CR>')           -- buffer prev
nnoremap('<localleader>q', ':Bdelete<CR>') -- buffer close using BufDelete plugin
nnoremap('<leader><tab>', 'gt')
nnoremap('<leader><S-tab>', 'gT')
nnoremap('<localleader>sf', '<cmd>source %<CR> | <cmd>lua vim.notify("Reloaded " .. vim.fn.expand(\'%\'))<CR>')

-- window control commands
nnoremap('<leader>!', ':wincmd |<CR>') -- make a window as large as possible
nnoremap('<leader>=', ':wincmd =<CR>') -- rebalance windows
nnoremap('<leader>q', ':q<CR>')        -- close window
nnoremap('<leader>-', ':split<CR>')
nnoremap('<leader>|', ':vsplit<CR>')
nnoremap('<leader>sh', ':split<CR>')
nnoremap('<leader>sv', ':vsplit<CR>')
nnoremap('<C-W>z', ':lua require("maximizer").toggle()<CR>')
nnoremap('<leader><Esc>', ':NoiceDismiss<CR>')
inoremap('<C-Esc>', ':NoiceDismiss<CR>')
nnoremap('<C-Esc>', ':NoiceDismiss<CR>')

-- CopilotChat mappings ('a' prefix for 'ai')
nnoremap('<leader>aa', ':CopilotChatToggle<CR>')
nnoremap('<leader>ac', ':CopilotChatCommit<CR>')
nnoremap('<leader>afd', ':CopilotChatFixDiagnostics<CR>')
nnoremap('<leader>ae', ':CopilotChatExplain<CR>')
nnoremap('<leader>at', ':CopilotChatTests<CR>')

-- nnoremap("<leader>jni", function()
--     local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
--     if venv ~= nil then
--       -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
--       venv = string.match(venv, "/.+/(.+)")
--       vim.cmd(("MoltenInit %s"):format(venv))
--     else
--       vim.cmd("MoltenInit python")
--     end
--   end)
nnoremap("<leader>ji", ":MoltenInit<CR>")
nnoremap("<leader>je", ":MoltenEvaluateOperator<CR>")
-- nnoremap("<leader>jrl", ":MoltenEvaluateLine<CR>")
-- nnoremap("<leader>rr", ":MoltenReevaluateCell<CR>")
-- nnoremap("<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
-- nnoremap("<leader>rd", ":MoltenDelete<CR>")
nnoremap("<leader>jip", ":MoltenImagePopup<CR>")
nnoremap("<leader>joh", ":MoltenHideOutput<CR>")
nnoremap("<leader>jos", ":noautocmd MoltenEnterOutput<CR>")

local runner = require("quarto.runner")
nnoremap("<leader>jrc", runner.run_cell)
nnoremap("<leader>jra", runner.run_above)
nnoremap("<leader>jrA", runner.run_all)
nnoremap("<leader>jrl", runner.run_line)
nnoremap("<leader>jr", runner.run_range)
nnoremap("<leader>jRA", function()
  runner.run_all(true)
end)

-- Obsidian mappings
nnoremap('<leader>ob', ':ObsidianBacklinks<CR>')
nnoremap('<leader>od', ':ObsidianDailies<CR>')
nnoremap('<leader>oe', ':ObsidianExtractNote<CR>')
vnoremap('<leader>oe', ':ObsidianExtractNote<CR>')
nnoremap('<leader>ol', ':ObsidianLinks<CR>')
nnoremap('<leader>on', ':ObsidianNew<CR>')
nnoremap('<leader>oo', ':ObsidianQuickSwitch<CR>')
nnoremap('<leader>or', ':ObsidianRename<CR>')
nnoremap('<leader>os', ':ObsidianSearch<CR>')
nnoremap('<leader>ot', ':ObsidianTags<CR>')

-- zk mappings
-- nnoremap( '<leader>zb', ':ZkBacklinks<CR>' )
-- nnoremap( '<leader>zj', ':ZkToday<CR>' )
-- nnoremap( '<leader>zd', ':ZkDailies<CR>' )
-- nnoremap( '<leader>zl', ':ZkLinks<CR>' )
-- nnoremap( '<leader>zn', ':ZkNotes<CR>' )
-- nnoremap( '<leader>zr', ':ZkRecents<CR>' )
-- nnoremap( '<leader>zt', ':ZkTags<CR>' )
-- nnoremap( '<leader>zcn', ':LmNewNote<CR>' )
-- vnoremap( '<leader>zct', ':ZkNewFromTitleSelection<CR>' )
-- vnoremap( '<leader>zcc', ':ZkNewFromContentSelection { title = vim.fn.input("Title:") }<CR>' )

-- window movement commands
tnoremap('<C-h>', '<C-\\><C-n>:wincmd h<CR>')
tnoremap('<C-l>', '<C-\\><C-n>:wincmd l<CR>')
tnoremap('<C-j>', '<C-\\><C-n>:wincmd j<CR>')
tnoremap('<C-k>', '<C-\\><C-n>:wincmd k<CR>')

-- terminal goodies
nnoremap('<C-T>', ':ToggleTerm<CR>')
tnoremap('<C-T>', '<C-\\><C-n>:ToggleTerm<CR>')
tnoremap('<C-e>', '<C-\\><C-n>')

-- various git extension commands

-- fugitive commands
-- nnoremap( '<localleader>gs', ':G<CR>'        )
-- nnoremap( '<localleader>gc', ':G commit<CR>' )
-- nnoremap( '<localleader>gp', ':G push<CR>'   )
-- nnoremap( '<localleader>gl', ':G log<CR>'    )
-- nnoremap( '<localleader>gd', ':G diff<CR>'   )
-- nnoremap( '<localleader>gb', ':G blame<CR>'  )

-- placeholder <leader>jn used as Jupyter Notebook prefix.  Keys defined in molten.lua
nnoremap('<localleader>gb', ':BlameToggle<CR>')
nnoremap('<localleader>gm', ':GitMessenger<CR>')

-- diffview commands
nnoremap('<leader>gdd', ':DiffviewOpen<CR>')
nnoremap('<leader>gdf', ':DiffviewFileHistory<CR>')
nnoremap('<leader>gdt', ':!git difftool<CR>')

-- gitsigns commands
nnoremap('<leader>gb', ':Gitsigns toggle_current_line_blame<CR>')
nnoremap('<leader>gw', ':Gitsigns toggle_current_word_diff<CR>')
nnoremap('<leader>ghh', ':Gitsigns preview_hunk<CR>')
nnoremap('<leader>ghn', ':Gitsigns next_hunk<CR>')
nnoremap('<leader>ghp', ':Gitsigns prev_hunk<CR>')
nnoremap('<leader>ghr', ':Gitsigns reset_hunk<CR>')
nnoremap('<leader>ghs', ':Gitsigns stage_hunk<CR>')

-- general LSP commands
nnoremap('<CR>', ':lua vim.lsp.buf.definition()<CR>')
nnoremap('gs', ':lua vim.lsp.buf.signature_help()<CR>')
nnoremap('<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
nnoremap('<leader>cl', '<cmd>GoCodeLenAct<CR>')

-- lspsaga commands
nnoremap('gh', '<cmd>Lspsaga lsp_finder<CR>')
nnoremap('gr', '<cmd>Lspsaga rename<CR>')
nnoremap('gd', '<cmd>Lspsaga peek_definition<CR>')
nnoremap('<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>')
nnoremap('<leader>cc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
nnoremap('[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
nnoremap(']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
nnoremap('<leader>ca', '<cmd>Lspsaga code_action<CR>')
nnoremap('K', '<cmd>Lspsaga hover_doc<CR>')

-- vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
-- remap('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',  opts)
-- remap('n', '<C-b>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

-- [c]uickfix commands (quickfix)
nnoremap('<localleader>co', ':copen<CR>')
nnoremap('<localleader>cc', ':cclose<CR>')
nnoremap('<localleader>cn', ':cnext<CR>')
nnoremap('<localleader>cp', ':cprev<CR>')
nnoremap('<localleader>cf', ':cfdo ')

-- view toggles
nnoremap('<localleader>ta', ':AerialToggle<CR>')
nnoremap('<localleader>tc', ':ColorizerToggle<CR>')
nnoremap('<localleader>ti', ':IBLToggle<CR>')
nnoremap('<localleader>tm', ':lua require("codewindow").toggle_minimap()<CR>')
nnoremap('<localleader>tt', ':set relativenumber!<CR>')
nnoremap('<localleader>tw', ':set list!<CR>')
nnoremap('<leader>hl', ':noh<CR>') -- clear last search highlight

-- Nvim Tree mappings
nnoremap('<leader>.', ':NvimTreeToggle<CR>')
-- nnoremap( '<leader>.', ':NeoTreeFocusToggle<CR>' )
nnoremap('<leader>u', ':UndotreeToggle<CR>')

-- Treesitter Mappings
nnoremap('<leader>tp', ':TSPlaygroundToggle<CR>')

-- Debugging mappings
nnoremap('<leader>dt', ':DapUiToggle<CR>')
nnoremap('<leader>dr', ':lua require("dapui").open({reset = true})<CR>')
nnoremap('<leader>djs', ':lua jump_to_element("dapui_scopes")<CR>')
nnoremap('<leader>djw', ':lua jump_to_element("dapui_watches")<CR>')
nnoremap('<leader>db', ':lua require("dap").toggle_breakpoint()<CR>')
nnoremap('<leader>dB', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
nnoremap('<leader>dfb', ':Telescope dap list_breakpoints<CR>')
nnoremap('<leader>dfc', ':Telescope dap commands<CR>')
nnoremap('<leader>dfv', ':Telescope dap variables<CR>')
nnoremap('<F9>', ':lua require("dap").toggle_breakpoint()<CR>')
nnoremap('<F1>', ':lua require("dap").continue()<CR>')
nnoremap('<F2>', ':lua require("dap").step_into()<CR>')
nnoremap('<F3>', ':lua require("dap").step_over()<CR>')
nnoremap('<F4>', ':lua require("dap").step_out()<CR>')
nnoremap('<leader>d?', function() require('dapui').eval(nil, { enter = true }) end)

-- Testing mappings
-- nnoremap( '<leader>tt', ':TestNearest<CR>')
-- nnoremap( '<leader>tf', ':TestFile<CR>')
-- nnoremap( '<leader>ta', ':TestSuite<CR>')
-- nnoremap( '<leader>tl', ':TestLast<CR>')
-- nnoremap( '<leader>tv', ':TestVisit<CR>')
nnoremap('<leader>tt', ':lua require("neotest").run.run()<CR>')
nnoremap('<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
nnoremap('<leader>tT', ':lua require("neotest").run.run(vim.uv.cwd())<CR>')
nnoremap('<leader>ta', ':lua require("neotest").run.attach()<CR>')


-- Telescope mappings
-- defaults: https://github.com/nvim-telescope/telescope.nvim/blob/618e0e6075b4215e43c6a848daa37ef4e354b5dc/lua/telescope/mappings.lua
nnoremap('<leader>ff', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>')
nnoremap('<leader>fs', ':Telescope live_grep<CR>')
nnoremap('<leader>fp', ':Telescope projects<CR>')
nnoremap('<leader>fe', ':Telescope frecency<CR>')
nnoremap('<leader><leader>ft', ':Telescope colorscheme<CR>')
nnoremap('<leader>flr', ':Telescope lsp_references<CR>')
nnoremap('<leader>fld', ':Telescope lsp_definitions<CR>')
nnoremap('<leader>fls', ':Telescope lsp_document_symbols<CR>')
nnoremap('<leader>flS', ':Telescope lsp_workspace_symbols<CR>')
nnoremap('<leader>fd', ':Telescope diagnostics bufnr=0<CR>')
nnoremap('<leader>fD', ':Telescope diagnostics<CR>')
nnoremap('<leader>ts', ':Telescope treesitter<CR>')
nnoremap('<leader>fb', ':Telescope file_browser<CR>')
nnoremap('<leader>fu', ':UrlView<CR>')
nnoremap('<leader>fqf', ':Telescope quickfix<CR>')
nnoremap('<leader>fqh', ':Telescope quickfixhistory<CR>')
nnoremap('<leader>fh', ':Telescope help_tags<CR>')
nnoremap('<leader>fc', ':Telescope commands<CR>')
nnoremap('<leader>f:', ':Telescope command_history<CR>')
nnoremap('<leader>fm', ':Telescope marks<CR>')
nnoremap('<leader>fn', ':Telescope notify<CR>')
nnoremap('<leader>fk', ':Telescope keymaps<CR>')
nnoremap('<leader>fr', ':Telescope registers<CR>')
nnoremap('<leader>fo', ':Telescope oldfiles<CR>')
nnoremap('<leader>ft', ':TodoTelescope<CR>')
nnoremap('<leader>fy', ':YAMLTelescope<CR>')
-- Telescope git
nnoremap('<leader>fgc', ':Telescope git_commits<CR>')
nnoremap('<leader>fgb', ':Telescope git_branches<CR>')
nnoremap('<leader>fgt', ':Telescope git_bcommits<CR>')
nnoremap('<leader>fgs', ':Telescope git_status<CR>')
-- Telescope notes custom
nnoremap('<leader>nf', ":lua require('liquidmantis.core.telescope-functions').find_notes()<CR>")
nnoremap('<leader>ns', ":lua require('liquidmantis.core.telescope-functions').grep_notes()<CR>")
nnoremap('<leader>/', ":lua require('liquidmantis.core.telescope-functions').search_in_buffer()<CR>")

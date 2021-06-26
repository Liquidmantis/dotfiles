-- disable netrw
vim.g.loaded_netrw  = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1


vim.api.nvim_command([[
augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction
]])


-- " Custom settings and mappings.
-- " let g:fern#disable_default_mappings = 1


-- " noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=


-- " function! FernInit() abort
-- "   nmap <buffer><expr>
-- "         \ <Plug>(fern-my-open-expand-collapse)
-- "         \ fern#smart#leaf(
-- "         \   "\<Plug>(fern-action-open:select)",
-- "         \   "\<Plug>(fern-action-expand)",
-- "         \   "\<Plug>(fern-action-collapse)",
-- "         \ )
-- "   nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
-- "   nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
-- "   nmap <buffer> n <Plug>(fern-action-new-path)
-- "   nmap <buffer> d <Plug>(fern-action-remove)
-- "   nmap <buffer> m <Plug>(fern-action-move)
-- "   nmap <buffer> M <Plug>(fern-action-rename)
-- "   nmap <buffer> h <Plug>(fern-action-hidden-toggle)
-- "   nmap <buffer> r <Plug>(fern-action-reload)
-- "   nmap <buffer> k <Plug>(fern-action-mark-toggle)
-- "   nmap <buffer> b <Plug>(fern-action-open:split)
-- "   nmap <buffer> v <Plug>(fern-action-open:vsplit)
-- "   nmap <buffer><nowait> < <Plug>(fern-action-leave)
-- "   nmap <buffer><nowait> > <Plug>(fern-action-enter)
-- " endfunction


-- " augroup FernGroup
-- "   autocmd!
-- "   autocmd FileType fern call FernInit()
-- " augroup END
-- ]])

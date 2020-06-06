" ===========================================================================
" CONFIGS
" ===========================================================================
set nobackup
set nowritebackup

let g:coc_global_extensions = ["coc-tsserver", "coc-prettier", "coc-json", "coc-html", "coc-json", "coc-css"]

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" ===========================================================================
" Contextual shortcuts
" ===========================================================================
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> D :call <SID>show_documentation()<CR>


" ===========================================================================
" CocList commands
" ===========================================================================
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent> rs :<C-u>CocRestart<CR>
command! -nargs=0 Format  :call CocAction('format')
command! -nargs=0 OR      :call CocAction('runCommand', 'editor.action.organizeImport')


" ===========================================================================
" Create mappings for function text object, requires document symbols feature of languageserver.
" ===========================================================================
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


" ===========================================================================
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
" ===========================================================================
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" ===========================================================================
" LOCAL FUNCTIONS
" ===========================================================================
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


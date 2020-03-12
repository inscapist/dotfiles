" NERD tree config
let g:NERDTreeWinPos = "left"
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '^tags.lock$', '^tags.temp$','\.git$[[dir]]', '\.sass-cache$', '\.pyc$', '__pycache__', '\.dll$', '\.pdb$', '\.scc$', '\.csproj$','\.resx$', 'node_modules']

" Toggle Nerdtree and open the current folder
function! ToggleNerdTree()
    if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
        execute ":NERDTreeClose"
    else
      if @% != ""
        execute ":NERDTreeFind"
      else
        execute ":NERDTreeToggle"
      endif
    endif
endfunction

nnoremap <silent> <space>op :call ToggleNerdTree()<CR>
nnoremap zp :NERDTreeFind<CR>



" Quick exit
nnoremap Q :qa<CR>


" Pane navigation
nnoremap <space>j <C-w>w
nnoremap <space>\ :vsp<CR>
nnoremap <space>- :sp<CR>
nnoremap <space>q <C-w>q
set splitbelow
set splitright


" Quickfix list
nnoremap <space>n :cnext<CR>
nnoremap <space>m :cprevious<CR>
nnoremap <space>w :cclose<CR>


" NERDTree
nnoremap <space>o :NERDTreeToggle<CR>

" === Denite shorcuts === "
"   <space>p - Browse list of files in current directory
"   <space>f - Search current directory for occurences of given term and close window if no results
"   <leader>;         - Browser currently open buffers
"   <leader>j - Search current directory for occurences of word under cursor
nnoremap <space>p :Denite file/rec<CR>
nnoremap <space>f :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>; :Denite buffer<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>


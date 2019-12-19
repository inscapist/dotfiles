" Quick exit
nnoremap Q :qa<CR>

" Pane navigation
nnoremap <leader>j <C-w>w
nnoremap <leader>\ :vsp<CR>
nnoremap <leader>- :sp<CR>
nnoremap <leader>Q <C-w>q
set splitbelow
set splitright

" Quickfix list
nnoremap ,n :cnext<CR>
nnoremap ,m :cprevious<CR>
nnoremap ,w :cclose<CR>

" NERDTree
nnoremap <leader>o :NERDTreeToggle<CR>

" Denite shorcuts
nnoremap <leader>p :Denite file/rec<CR>
nnoremap <leader>F :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>; :Denite buffer<CR>
nnoremap <leader>c :<C-u>DeniteCursorWord grep:.<CR>


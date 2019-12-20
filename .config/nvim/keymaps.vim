let mapleader=","

" easymotion prefix
map \\ <Plug>(easymotion-prefix)
map \\r <Plug>(easymotion-lineanywhere)

" Quick reload vimrc
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Remove everything from buffer, expecting a new paste
nnoremap <silent> <leader>K gg"_dG

" Copy everything to register
nnoremap <silent> <leader>C :%y+<CR>

" Quick exit
nnoremap Q :qa<CR>

" Pane navigation
nnoremap <space>g <C-w>w
nnoremap <space>\ :vsp<CR>
nnoremap <space>- :sp<CR>
nnoremap <space>qq <C-w>q
set splitbelow
set splitright

" Alias to <C-o>, jump back to previous loc
nnoremap <space>o <C-o>

" Quickfix list
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <C-w> :cclose<CR>

" NERDTree
nnoremap <space>l :NERDTreeToggle<CR>

" Denite shorcuts
nnoremap <silent> <leader>l :Denite outline<CR>
nnoremap <silent> <leader>; :Denite buffer<CR>
nnoremap <silent> <leader>p :Denite -start-filter=1 file/rec<CR>
nnoremap <silent> <space>s :<C-u>Denite -start-filter=1 decls<CR>
nnoremap <silent> <leader>ff :<C-u>Denite grep:. -no-empty<CR>
nnoremap <silent> <leader>c :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <silent> <space>p :Denite -resume<CR>

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
nnoremap <silent> <space>g <C-w>w
nnoremap <silent> <space>\ :vsp<CR>
nnoremap <silent> <space>- :sp<CR>
nnoremap <silent> <space>qq <C-w>q
set splitbelow
set splitright

" Alias to <C-o>, jump back to previous loc
nnoremap <space>o <C-o>

" Quickfix list
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <C-w> :cclose<CR>

" NERDTree
nnoremap <silent> <space>l :NERDTreeToggle<CR>

" Denite shorcuts
nnoremap <silent> <leader>l :Denite outline -auto-action=preview<CR>
nnoremap <silent> <leader>; :Denite buffer<CR>
nnoremap <silent> <leader>p :Denite file/rec -start-filter=1<CR>
nnoremap <silent> <space>s :<C-u>Denite decls -start-filter=1<CR>
nnoremap <silent> <leader>ff :<C-u>Denite grep:. -auto-action=preview -no-empty<CR>
nnoremap <silent> <leader>c :<C-u>DeniteCursorWord grep:. -auto-action=preview <CR>
nnoremap <silent> <space>p :Denite -resume<CR>

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
nnoremap Q :qa!<CR>
" Quick save
nnoremap S :write<CR>

" Pane navigation
nnoremap <silent> <space>g <C-w>w
nnoremap <silent> <space>j <C-w>J
nnoremap <silent> <space>h <C-w>H
nnoremap <silent> <space>\ :vsp<CR>
nnoremap <silent> <space>- :sp<CR>
nnoremap <silent> <space>qq <C-w>q
set splitbelow
set splitright

" Alias to <C-o>, jump back to previous loc
nnoremap <leader>o <C-o>
" Alias to :b#, jumps back to previous buffer
nnoremap <space>b :b#<CR>

" Quickfix list
noremap <C-n> :cnext<CR>
noremap <C-m> :cprevious<CR>
noremap <C-w> :cclose<CR>

" NERDTree
nnoremap <silent> <space>n :NERDTreeToggle<CR>

" Set syntax folding
nnoremap <silent> <space>fo :setlocal foldmethod=syntax<CR>

" Quicktype :%s/
nnoremap <space>fs :%s/

" Denite shorcuts
nnoremap <silent> <space>p :Denite file/rec -start-filter=1<CR>
nnoremap <silent> <space>r :Denite -resume<CR>
nnoremap <silent> <space>t :<C-u>Denite tag -start-filter=1 -no-empty<CR>
nnoremap <silent> <space>o :Denite outline -no-empty<CR>
nnoremap <silent> <space>; :Denite buffer -auto-action=preview -no-empty<CR>
nnoremap <silent> <space>fw :<C-u>Denite grep:. -auto-action=preview -no-empty<CR>
" space c is used by coc command
nnoremap <silent> <leader>c :<C-u>DeniteCursorWord grep:. -auto-action=preview <CR>

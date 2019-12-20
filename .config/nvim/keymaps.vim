let mapleader=","

" Quick reload vimrc
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Remove everything from buffer, expecting a new paste
nnoremap <leader>K gg"_dG

" Quick exit
nnoremap Q :qa<CR>

" Pane navigation
nnoremap <leader>g <C-w>w
nnoremap <leader>\ :vsp<CR>
nnoremap <leader>- :sp<CR>
nnoremap <leader>qq <C-w>q
set splitbelow
set splitright

" Quickfix list
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <C-w> :cclose<CR>

" NERDTree
nnoremap <leader>o :NERDTreeToggle<CR>

" Denite shorcuts
nnoremap <leader>; :Denite buffer<CR>
nnoremap <leader>p :Denite -start-filter=1 file/rec<CR>
nnoremap <silent> <space>s :<C-u>Denite -start-filter=1 decls<CR>
nnoremap <leader>ff :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>c :<C-u>DeniteCursorWord grep:.<CR>


" Convention
" leader is used for less frequent keys
" space is used for more frequent keys
" \\ is used for far reaching movements (easymotion)

let mapleader=","

" easymotion prefix
map \\ <Plug>(easymotion-prefix)
map \\r <Plug>(easymotion-lineanywhere)
" Alias to <C-o>, jump back to previous loc
nnoremap <silent> \o <C-o>
" Alias to :b#, jumps back to previous buffer
nnoremap <silent> \b :b#<CR>

" Switch theme
nnoremap <silent> <space>mtl :set background=light<CR>
nnoremap <silent> <space>mtd :set background=dark<CR>

" Simple glucose
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk
vnoremap B ^
vnoremap E $
nnoremap B ^
nnoremap E $

" quick scroll up and down
nnoremap zj ztLzz
nnoremap zk zbHzz

" Quick reload vimrc
nnoremap <leader>sc :source $MYVIMRC<CR>

" Remove everything from buffer, expecting a new paste
nnoremap <leader>K gg"_dG

" Copy everything to register
nnoremap <leader>C :%y+<CR>

" Quick exit/save
nnoremap <silent> Q :qa!<CR>
nnoremap <silent> S :write<CR>

" Pane navigation
nnoremap <silent> <C-\> <C-w>w
nnoremap <silent> <space>\ :vsp<CR>
nnoremap <silent> <space>- :sp<CR>
nnoremap <silent> ss :sp<CR>
nnoremap <silent> vv :vsp<CR>
nnoremap <silent> qq <C-w>q
set splitbelow
set splitright

" Quickfix list
noremap <silent> <C-n> :cnext<CR>
noremap <silent> <C-m> :cprevious<CR>
noremap <silent> <C-w> :cclose<CR>

" NERDTree
" toggle Nerdtree and open the current folder
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
nnoremap <silent> <space>w :call ToggleNerdTree()<CR>

" Set custom folding
nnoremap <space>fos :setlocal foldmethod=syntax<CR>
nnoremap <space>foi :setlocal foldmethod=indent<CR>

" quicktypes
nnoremap <space>fs :%s///g
nnoremap <space>fc :cfdo %s///g \| update

" Denite shorcuts
nnoremap <silent> <space>p :Denite file/rec -start-filter=1<CR>
nnoremap <silent> <space>r :Denite -resume<CR>
nnoremap <silent> <space>t :<C-u>Denite tag -start-filter=1 -no-empty<CR>
nnoremap <silent> <space>o :Denite outline -no-empty<CR>
nnoremap <silent> <space>; :Denite buffer -auto-action=preview -no-empty<CR>
nnoremap <silent> <space>fw :<C-u>Denite grep:. -auto-action=preview -no-empty<CR>
nnoremap <silent> <space>* :<C-u>DeniteCursorWord grep:. -auto-action=preview <CR>

" lazygit
function! ToggleLazyGit()
  call OpenTerm('lazygit')
endfunction
nnoremap <silent> <space>lg :<C-u>call ToggleLazyGit()<CR>

" Scroll using arrows
function! ScrollQuarter(move)
    let height=winheight(0)

    if a:move == 'up'
        let key="\<C-Y>"
    else
        let key="\<C-E>"
    endif

    execute 'normal! ' . height/4 . key
endfunction

nnoremap <silent> <s-up> :call ScrollQuarter('up')<CR>
nnoremap <silent> <s-down> :call ScrollQuarter('down')<CR>

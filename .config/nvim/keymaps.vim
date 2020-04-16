" Convention
" leader is used for less frequent keys
" space is used for more frequent keys
" \\ is used for far reaching movements (easymotion)

let mapleader=","

" disable interfering features
nnoremap q: <nop>
nnoremap q <nop>

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
nnoremap rr :noh<cr>
nnoremap rf :set foldmethod=manual<CR> zE
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk
vnoremap B ^
vnoremap E $
nnoremap B ^
nnoremap E $
nmap f <Plug>(easymotion-sl)
nmap F <Plug>(easymotion-s2)

" Quick reload vimrc
nnoremap <leader>sc :source $MYVIMRC<CR>

" Remove everything from buffer, expecting a new paste
nnoremap <leader>K gg"_dG

" Copy everything to register
nnoremap <leader>C :%y+<CR>

" Quick exit/save
nnoremap <silent> Q :qa<CR>
nnoremap <silent> S :write<CR>

" Pane navigation
"Switch between different windows by their direction`
noremap <C-j> <C-w>j| "switching to below window
noremap <C-k> <C-w>k| "switching to above window
noremap <C-l> <C-w>l| "switching to right window
noremap <C-h> <C-w>h| "switching to left window
nnoremap <silent> <C-\> <C-w>w
nnoremap <silent> <space>w <C-w>w
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
noremap <silent> <C-q> :cclose<CR>

" Set custom folding
set foldcolumn=1
nnoremap <space>fos :setlocal foldmethod=syntax<CR>
nnoremap <space>foi :setlocal foldmethod=indent<CR>
nnoremap <space>fom :setlocal foldmethod=indent<CR>
autocmd BufRead,BufNewFile *.py nnoremap <tab> za
autocmd BufRead,BufNewFile *.json nnoremap <tab> za

" quicktypes
nnoremap <space>ss :%s///g
nnoremap <space>sc :cfdo %s///g \| update

" Denite shorcuts
" nnoremap <silent> <space>p :Denite file/rec -start-filter=1<CR>
nnoremap <silent> <expr> <space><space> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Denite file/rec -start-filter=1\<cr>"
nnoremap <silent> <expr> <space>or (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Denite -resume\<cr>"
nnoremap <silent> <expr> <space>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Denite buffer -auto-action=preview -no-empty\<cr>"
nnoremap <silent> <expr> <space>fw (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":\<c-u>Denite grep:. -auto-action=preview -no-empty\<cr>"
nnoremap <silent> <expr> <space>* (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":\<c-u>DeniteCursorWord grep:. -auto-action=preview -no-empty\<cr>"

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
nnoremap <silent> K :call ScrollQuarter('up')<CR>
nnoremap <silent> J :call ScrollQuarter('down')<CR>

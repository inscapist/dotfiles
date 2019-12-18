" Quick exit
nnoremap Q :qa<CR>


" Pane navigation
nnoremap <space>j <C-w>w
nnoremap <space>\ :vsp<CR>
nnoremap <space>- :sp<CR>
nnoremap <space>q <C-w>q
" nnoremap <C-j> <C-w>j 
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
set splitbelow
set splitright


" Quickfix list
nnoremap <space>n :cnext<CR>
nnoremap <space>m :cprevious<CR>
nnoremap <space>w :cclose<CR>


" NERDTree
nnoremap <space>o :NERDTreeToggle<CR>


" FZF
nnoremap <silent> <space>p :Files<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

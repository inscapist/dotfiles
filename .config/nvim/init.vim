call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/vim-scripts/dbext.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim'
Plug 'mtth/scratch.vim'
" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Themes
" Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
" Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jceb/vim-orgmode'
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set ttyfast
set cmdheight=2
set updatetime=500
set shortmess+=c
set signcolumn=yes

set autoindent                  " Autoindent based on current line
set tabstop=2 shiftwidth=2 expandtab

" autosave on focus lost
:au FocusLost * silent! wa
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

let g:AutoPairsMapBS=1
let g:scratch_persistence_file="~/.scratchpad"
let g:EasyMotion_smartcase=1

" toggle indent line with :IndentLinesEnable
let g:indentLine_enabled=1
let g:indentLine_fileType=["python"]

" org mode
let g:org_indent=1
let g:org_export_emacs="/usr/local/bin/emacs"

set background=dark
set termguicolors

" Valid options are: soft, hard, medium
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_italic=1
let g:gruvbox_bold=1
colorscheme gruvbox

" manual folding
set foldmethod=manual

" emmet
let g:user_emmet_leader_key=','
let g:user_emmet_mode='inv'  "enable for insert, visual, normal mode

" Source additional vim files
source ~/.config/nvim/autocomplete.vim
source ~/.config/nvim/coc-plug.vim
source ~/.config/nvim/denite.vim
source ~/.config/nvim/embedded-term.vim
source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/vista.vim
source ~/.config/nvim/zen.vim

" languages
source ~/.config/nvim/langs/go.vim
source ~/.config/nvim/langs/python.vim

" TODO NOTE TODO OPTIMIZE
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|URGENT|NOTE|TODO|OPTIMIZE|IGNORE|SKIP)/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

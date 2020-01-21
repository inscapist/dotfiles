call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Themes
Plug 'morhetz/gruvbox'
" Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
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
set tabstop=2 shiftwidth=2 expandtab
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" autosave on focus lost
:au FocusLost * silent! wa
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

let g:NERDTreeWinPos = "left"
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '^tags.lock$', '^tags.temp$','\.git$[[dir]]', '\.sass-cache$']
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1
let g:AutoPairsMapBS=0

" UI - Gruvbox
set background=dark
set termguicolors
colorscheme gruvbox

" manual folding
set foldmethod=manual

" Source additional vim files
source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/denite.vim
source ~/.config/nvim/embedded-term.vim
source ~/.config/nvim/langs/go.vim
source ~/.config/nvim/coc-plug.vim
source ~/.config/nvim/autocomplete.vim


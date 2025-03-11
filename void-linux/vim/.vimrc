" Firstly, install Vundle to get plugins:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Set some required specs:
set encoding=UTF-8
set nocompatible              " required
filetype off                  " required
 
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" START PLUGUIN !! 
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'roxma/vim-paste-easy'
Plugin 'chr4/nginx.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
" END PLUGIN !!

"Some configurations for plugins:
let g:airline_theme='alduin'
let vim_markdown_preview_github=1
let g:AutoPairs = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'", '```': '```' }

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

filetype plugin indent on    " required

" Turn syntax highlighting on
syntax on

" Other good options
set autoindent    " Auto-indent new lines
set shiftwidth=4  " Number of auto-indent spaces
set shiftwidth=4  " Enable smart-tabs
set smartindent    " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4  " Number of spaces per Ta
set hlsearch    " highlight search results
set ignorecase    " do case insensitive search
set expandtab    " fill tabs with spaces
set nojoinspaces  " no extra space after '.' when joining lines
set relativenumber


" Ativar/desativar o modo paste com Ctrl+Shift+V
set pastetoggle=<C-S-v>

hi LineNrAbove guifg=red ctermfg=red
hi LineNrBelow guifg=green ctermfg=green

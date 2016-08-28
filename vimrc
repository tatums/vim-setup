"
"   ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
"   ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
"   ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
"   ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
" ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
" ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝
"

set nocompatible               " be iMproved
filetype off                   " required!
syntax on

"Show line numbers
set number

" show the bottom status bar
set laststatus=2
" Let backspace work like a normal editor
set backspace=2
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" dont bother with the .swp files
set noswapfile

set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set history=100
set nowrap
set smartindent
set autoindent

" Needed for indention in nodejs and js
filetype indent on

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/command-t'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Plugin 'vim-scripts/nginx.vim'
Plugin 'pangloss/vim-javascript'
call vundle#end()

au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile *.conf set ft=nginx

colorscheme jelleybeans

"map leader to space
let mapleader=" "

" navigate windows easily
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

" reload vim config
map <leader>s :source ~/.vimrc<CR>
" Nerdtree
map <Leader>n :NERDTreeToggle<CR>

" Strip whitespace on save
autocmd BufWritePre * StripWhitespace

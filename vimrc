set nocompatible               " be iMproved
"filetype off                   " required!
filetype indent on

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
call vundle#end()

"colorscheme jellybeans+
colorscheme jelleybeans

syntax on
set number
let mapleader=" "
set t_Co=256
set tabstop=2 shiftwidth=2 expandtab

set laststatus=2
set backspace=2

nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

set noswapfile

map <leader>s :source ~/.vimrc<CR>

set hidden
set history=100
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

autocmd BufWritePre * StripWhitespace "Strip whitespace on save

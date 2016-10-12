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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Plugin 'vim-scripts/nginx.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'guns/vim-sexp'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" END Snipmate
Plugin 'easymotion/vim-easymotion'
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


nnoremap <Leader>json :%!python -m json.tool<CR>

" reload vim config
map <leader>s :source ~/.vimrc<CR>
" Nerdtree
map <Leader>n :NERDTreeFind<CR>

" Strip whitespace on save
autocmd BufWritePre * StripWhitespace


" clojure indenting
autocmd FileType clojure set lispwords+=describe,describe-server,it,
      \before-all,after-all,before,after,init-state,render,render-state,
      \will-mount,did-mount,should-update,will-receive-props,will-update,
      \did-update,display-name,will-unmount,describe-with-db,
      \describe-with-server,swaggered,describe-with-db,describe-with-es,
      \context,context*,GET*,POST*,PUT*,DELETE*,poll-es-until-timeout,
      \around,defstate,if-let,ns,doseq,testing
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

" associate *.foo with php filetype
au BufRead,BufNewFile *.boot setfiletype clojure


function! ConnectToNREPL(...)
  let s:context_path = a:0 > 1 ? a:2 : "."
  let s:port = a:0 > 0 ? a:1 : system("cat " . s:context_path . "/" . ".nrepl-port")
  let s:replpath = "nrepl://localhost:" . s:port . " " . s:context_path
  execute "Connect " . s:replpath . " " . s:context_path
endfunction
command! -nargs=* REPL call ConnectToNREPL(<f-args>)


" ignore pattern for ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

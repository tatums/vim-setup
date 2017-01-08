#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DEFAULT='\e[0m' # No Color
RED='\e[31m'

function say {
  printf "\n${RED} $@ ${DEFAULT}\n"
}

function InstallVundle () {
  if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  fi
  vim +PluginInstall +qall
}

function SymlinkVimRc () {
  ln -sf $DIR/vimrc $HOME/.vimrc && \
  say "Symlink $HOME/.vimrc created"
}

InstallVundle && \
  SymlinkVimRc

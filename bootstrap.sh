#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

files="vimrc"

for file in $files; do
    echo "----Creating symlink to $file in home directory."
    ln -sf $DIR/$file ~/.$file
done
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

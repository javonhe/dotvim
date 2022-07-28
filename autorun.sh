#!/bin/bash
mv dotvim .vim
mkdir -p .vim/undodir
ln -s .vim/vimrc .vimrc
cd .vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git
vim

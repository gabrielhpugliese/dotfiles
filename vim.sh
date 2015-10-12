#!/bin/sh
set -e -x

cd /tmp/dotfiles
mkdir ~/.vim
cp -r vim/* ~/.vim
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc
mkdir -p ~/.vimfiles/backup/
vim +BundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py

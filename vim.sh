#!/bin/sh

cd /tmp
git clone https://github.com/gabrielhpugliese/dotfiles.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
cd dotfiles
cp -r vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
mkdir -p ~/.vimfiles/backup/
vim +BundleInstall +qall

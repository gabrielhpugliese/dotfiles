#!/bin/sh

cd /tmp
git clone https://github.com/gabrielhpugliese/dotfiles.git
cd dotfiles
cp -r vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
mkdir -p ~/.vimfiles/backup/
vim +BundleInstall +qall
cd /tmp
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
cd ~/.vim/bundle/vundle
./install.py

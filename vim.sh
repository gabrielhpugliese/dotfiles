#!/bin/sh
set -e -x

cd /tmp
git clone https://github.com/gabrielhpugliese/dotfiles.git
cd dotfiles
cp -r vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
mkdir -p ~/.vimfiles/backup/
vim +BundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py

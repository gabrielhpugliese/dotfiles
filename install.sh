#!/bin/sh

add-apt-repository ppa:chris-lea/node.js
add-apt-repository ppa:pi-rho/dev
apt-get --yes update
apt-get --yes install gnome git vim-gtk tmux nodejs python-pip python-software-properties ctags python-dev htop libjpeg-dev libgif-dev curl xsel
\curl -sSL https://get.rvm.io | bash -s stable --ruby
gem install tmuxinator
bash powerline.sh
mkdir ~/.vimfiles/backup/
pip install virtualenvwrapper

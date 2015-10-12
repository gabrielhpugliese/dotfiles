#!/bin/sh

sudo apt-get --yes update
sudo apt-get --yes install vim-gtk tmux python-pip python-software-properties ctags python-dev htop libjpeg-dev libgif-dev curl xsel cmake
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo add-apt-repository --yes ppa:nmi/vim-snapshots
sudo add-apt-repository --yes ppa:kalakris/cmake
\curl -sSL https://get.rvm.io | bash -s stable --ruby

cp bash_prompt.sh ~/
cp gitconfig ~/.gitconfig
cp gitignore_global ~/.gitignore_global
cp tmux.conf ~/.tmux.conf
cp -r tmuxinator/ ~/.tmuxinator
cat bashrc >> ~/.bashrc
source ~/.bashrc

gem install tmuxinator
sudo pip install virtualenvwrapper

bash powerline.sh
bash vim.sh

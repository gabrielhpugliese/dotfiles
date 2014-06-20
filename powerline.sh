#!/bin/sh

# Powerline
pip install --user git+https://github.com/Lokaltog/powerline
mkdir ~/.fonts/
mkdir ~/.fonts.conf.d/
mkdir -p ~/.config/fontconfig/conf.d/
cd /tmp
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://raw.githubusercontent.com/Lokaltog/powerline/develop/font/10-powerline-symbols.conf
git clone https://github.com/Lokaltog/powerline-fonts
mv PowerlineSymbols.otf ~/.fonts/
cp 10-powerline-symbols.conf ~/.fonts.conf.d/
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
mv powerline-fonts/* ~/.fonts/
fc-cache -vf ~/.fonts

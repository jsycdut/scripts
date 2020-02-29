#!/usr/bin/env bash

CURRENT_DIR=`pwd`
NVIM_CONFIG_DIR="$HOME/.config/nvim/"
FONT_DIR="$HOME/.local/share/fonts"

# get vim-plug
mkdir -p $NVIM_CONFIG_DIR/autoload
curl -fLo $NVIM_CONFIG_DIR/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# clear
test -e $HOME/.vimrc && rm $HOME/.vimrc
test -e $NVIM_CONFIG_DIR/init.vim && rm $NVIM_CONFIG_DIR/init.vim

# link config files
cd $NVIM_CONFIG_DIR
ln -s ${CURRENT_DIR}/vimrc init.vim

cd $HOME
ln -s ${CURRENT_DIR}/vimrc .vimrc

## get and install font
#mkdir -p  $FONT_DIR
#cd $FONT_DIR
#wget -O ubuntu-nerd-mono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
#unzip ubuntu-nerd-mono.zip
#fc-cache -fv

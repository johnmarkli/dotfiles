#!/bin/bash

clear

echo "Setting up Vim"

echo "Linking vimrc file"
ln -s ~/dotfiles/vimrc ~/.vimrc

echo "Installing Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
	curl -Sso ~/.vim/autoload/pathogen.vim \
	https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Installing Bundles for Pathogen"
cd ~/.vim/bundle && git clone https://github.com/kien/ctrlp.vim.git
cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git
cd ~/.vim/bundle && git clone https://github.com/altercation/vim-colors-solarized.git
cd ~/.vim/bundle && git clone https://github.com/christoomey/vim-tmux-navigator.git
cd ~/.vim/bundle && git clone https://github.com/tpope/vim-sensible.git

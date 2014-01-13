#!/usr/bin/env ruby
#`
# Setup Vim stuff in a new environment
#
#

link_vimrc_file = `ls -s ~/dotfiles/vimrc ~/.vimrc`

install_pathogen = `mkdir -p ~/.vim/autoload ~/.vim/bundle; \
	curl -Sso ~/.vim/autoload/pathogen.vim \
	    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim`

install_ctrl_p = `cd ~/.vim/bundle && git clone https://github.com/kien/ctrlp.vim.git`
install_nerd_tree = `cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git`
install_ = `cd ~/.vim/bundle && git clone https://github.com/altercation/vim-colors-solarized.git`



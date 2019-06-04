#!/bin/bash

# install homebrew
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle install --file ../Brewfile --verbose

# pip install gcalcli
# pip install slack-cli

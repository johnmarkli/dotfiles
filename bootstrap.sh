#!/usr/bin/env bash
#
# bootstrap installs things

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $(basename "$src"), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=${BACKUP_ALL:-false} skip_all=false

  for src in $(find "$DOTFILES_ROOT" -maxdepth 3 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    info "$src"
    info "$dst"
    link_file "$src" "$dst"
  done
}

setup() {
  SRC="$1"
  DST="$2"
  echo "Installing $SRC..."

  mkdir -p $(dirname "$DST")
  ln -sfn "$PWD/dotfiles/$SRC" "$DST"
}


# install_neobundle () {
#   info 'installing neobundle'
#   wget https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh
#   chmod +x ./install.sh
#   ./install.sh
#   rm ./install.sh
# }

install_dein () {
  info 'installing dein'
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
  chmod +x ~/installer.sh
  sh ~/installer.sh ~/.cache/dein
  rm ~/installer.sh
}

install_dotfiles
# setup ssh_config "$HOME/.ssh/config"
setup configs/init.vim.symlink "$HOME/.config/nvim/init.vim"
setup configs/dracula.tmux.symlink "$HOME/.config/tmux/themes/dracula.tmux"
setup configs/i3config.symlink "$HOME/.config/i3/config"
setup configs/i3statusconfig.symlink "$HOME/.config/i3status/config"
setup configs/termiteconfig.symlink "$HOME/.config/termite/config"
setup configs/fontconfig.symlink "$HOME/.config/fontconfig/fonts.conf"
setup configs/compton.conf.symlink "$HOME/.config/compton.conf"
# setup bin "$HOME/bin"
# install_neobundle
install_dein

echo ''
echo '  All installed!'


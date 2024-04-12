#!/bin/bash

function install_dot() {
  _file=$1
  _dotfile=~/.`basename ${_file}`
  if [ -e ${_dotfile} -a ! -L ${_dotfile} ]; then
      mv ${_dotfile} ${_dotfile}.bak
  fi
  ln -hfs `pwd`/${_file} ${_dotfile}
  echo "..installing ${_file}"
}

 install_dot bash_profile
 install_dot bashrc
 #install_dot iex.exs
 #install_dot spacemacs
 install_dot tmux.conf
 #install_dot tmuxinator
 install_dot sql
 install_dot vim
 install_dot vimrc
 install_dot oh-my-zsh/zshrc

# TODO add install for config/<dir> under ~/.config/<dir> synlinked
# TODO add install for ~/.vim
# TODO add install for Code/User/settings.json to ~/Library/ApplicationSupport/Code/User/settings.json

#!/bin/bash

function install_dot() {
  _file=$1
  _dotfile=~/.${_file}
  if [ -f ${_dotfile} -a ! -L ${_dotfile} ]; then
      mv ${_dotfile} ${_dotfile}.bak
  fi
  ln -fs `pwd`/${_file} ${_dotfile}
  echo "..installing ${_file}"
}

install_dot bash_profile
install_dot bashrc
install_dot iex.exs
install_dot spacemacs

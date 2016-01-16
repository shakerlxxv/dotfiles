#!/bin/bash

if [ -f ~/.bash_profile ]; then
    mv ~/.bash_profile ~/.bash_profile.bak
fi

if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
fi

if [ -f ~/.iex.exs ]; then
    mv ~/.iex.exs ~/.iex.exs.bak
fi

( ln -s `pwd`/bash_profile ~/.bash_profile &&
    ln -s `pwd`/bashrc ~/.bashrc &&
    ln -s `pwd`/iex.exs ~/.iex.exs &&
    echo "Install completed"
) || echo "Install failed"

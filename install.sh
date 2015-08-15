#!/bin/bash

if [ -f ~/.bash_profile ]; then
    mv ~/.bash_profile ~/.bash_profile.bak
fi

if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
fi

( ln -s `pwd`/bash_profile ~/.bash_profile &&
    ln -s `pwd`/bashrc ~/.bashrc &&
    echo "Install completed"
) || echo "Install failed"

#!/usr/bin/env bash

ln -s $(pwd)/vim/.gvimrc ~/.vimrc
echo "已将 $(pwd)/vim/.gvimrc 复制到 ~/.vimrc"

ln -s $(pwd)/vim/.gvimrc ~/.gvimrc
echo "已将 $(pwd)/vim/.gvimrc 复制到 ~/.gvimrc"

#ln -s $(pwd)/vim ~/.vim
#echo "已将 $(pwd)/vim 复制到 ~/.vim"

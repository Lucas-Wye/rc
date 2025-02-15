#! /usr/bin/bash

pconfig=`pwd`/config
dirs=`ls config`
for dir in $dirs
do
  echo $pconfig/$dir $HOME/.config/$dir
  ln -s $pconfig/$dir $HOME/.config/$dir
done

pdot=`pwd`/dotfiles
dotfiles=`ls dotfiles`
for dotfile in $dotfiles
do
  echo $pdot/$dotfile $HOME/.$dotfile
  ln -s $pdot/$dotfile $HOME/.$dotfile
done

# add bash.env
echo "source `pwd`/bash.env" >> $HOME/.bashrc

# for NixOS, link bash.env
ln -s `pwd`/bash.env $HOME/.bash.env

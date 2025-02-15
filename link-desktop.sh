#! /usr/bin/bash

pconfig=`pwd`/desktop/config
dirs=`ls desktop/config`
for dir in $dirs
do
  echo $pconfig/$dir $HOME/.config/$dir
  ln -s $pconfig/$dir $HOME/.config/$dir
done

# rime
ln -s `pwd`/rime $HOME/.local/share/fcitx5/rime

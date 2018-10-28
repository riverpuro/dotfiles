#!/bin/sh

_banner() {
  echo
  echo "########################################"
  echo "$1"
  echo "########################################"
}

_mkdir() {
  echo "mkdir -p $1"
  mkdir -p "$1"
}

_ln() {
  local src=$1
  local dst=$2
  if [ -L $dst ]; then
    echo "rm exists symlink"
    rm $dst
    echo "ln -s $src $dst"
    ln -s "$src" "$dst"
  elif [ -e $dst ]; then
    echo "$dst exists!"
  else
    echo "ln -s $src $dst"
    ln -s "$src" "$dst"
  fi
}

_cp() {
  local src=$1
  local dst=$2
  echo "cp -n $src $dst"
  cp -n "$src" "$dst"
}

cd `dirname $0`
CWD=`pwd`


_banner "create my directories"

targets=(local bin src tmp work)
for dir in ${targets[@]}
do
  path="$HOME/$dir"
  _mkdir "$path"
done


_banner "create sym links"

targets=(.profile .bash_profile .bashrc .screenrc .vimrc .vim .neobundle.vimrc .pluginconf.vimrc .zshrc .zlogin)
for conf in ${targets[@]}
do
  src="$CWD/config/$conf"
  dst="$HOME/$conf"
  _ln $src $dst
done


_banner "copy my commands"

targets=(update-vim update-emacs)
for cmd in ${targets[@]}
do
  src="$CWD/bin/$cmd"
  dst="$HOME/bin/$cmd"
  _ln $src $dst
done

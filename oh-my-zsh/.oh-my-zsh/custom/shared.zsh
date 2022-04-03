#!/bin/bash

function yes_or_no
{
  while true; do
    printf '%s %s ' $1 '[y/n]'
    read yn
    case $yn in
      [Yy]*) return 0 ;;
      [Nn]*) return 1 ;;
    esac
  done
}

function changeNode14
{
  echo -n "nvm current: "
  nvm current
  if yes_or_no "run: nvm use 14.18.1"; then
    nvm use 14.18.1
  fi
}

function changeNode17
{
  echo -n "nvm current: "
  nvm current
  if yes_or_no "run: nvm use 17.5.0"; then
    nvm use 17.5.0
  fi
}

menu ()
{
  echo -n $fg[green]
  echo "\nHello :)${fg[default]}\n"
  selected=`find -L $HOME/.config/personal/projects -maxdepth 1 -type f | xargs -L1 basename | fzf --height=10 --reverse --border`
  if [[ -z $selected ]]; then
    exit 0
  fi
  file=$HOME/.config/personal/projects/$selected
  printf "You selected %s\n" $file
  source $file
}

alias menu="menu"

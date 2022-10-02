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
  clear
  echo -n $fg[green]
  echo "\n Hello Martin${fg[default]} ~"
  echo -n $fg[green]
  echo "\n How can I help you?\n"
  echo -n $fg[default]
  selected=`find -L $HOME/.config/personal/projects -maxdepth 1 -type f | xargs -L1 basename | fzf --height=50% --reverse --border`
  if [[ -z $selected ]]; then
    echo -n $fg[red]
    echo " Not found\n"
    echo -n $fg[default]
  else
    file=$HOME/.config/personal/projects/$selected
    printf "You selected %s\n" $file
    clear
    source $file
  fi
}

alias menu="menu"
alias lg="lazygit"

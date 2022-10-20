#!/usr/bin/env bash

export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME
export PATH=$PORG_HOME/usr/bin:$PATH

./apps/porg.sh          > /dev/null 2>&1
echo -e "\e[34mInstalled Porg Package Manager\e[m"

./apps/libevent.sh      > /dev/null 2>&1
echo -e "\e[34mInstalled libevent\e[m"

./apps/ncurses.sh       > /dev/null 2>&1
echo -e "\e[34mInstalled ncurses\e[m"

./apps/tmux.sh          > /dev/null 2>&1
echo -e "\e[34mInstalled tmux\e[m"

./apps/google-chrome.sh > /dev/null 2>&1
echo -e "\e[34mInstalled Google-Chrome\e[m"

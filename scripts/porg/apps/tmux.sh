#!/usr/bin/env bash

## tmux
## Dependencies: libevent, libcurses

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r tmux
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/tmux

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/tmux
cd        ${HOME}/.porg/$HOSTNAME/src/tmux

## Download
export TMUX_URL=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep "\"browser_download_url\": \"[^\"]*.tar.gz\"" | sed "s/\"browser_download_url\": //g" | sed "s/[\" ]//g")
wget --no-check-certificate $TMUX_URL
tar -zxvf tmux-*.tar.gz
mv tmux-*.tar.gz tmux.tar.gz
cd tmux-*

## Install
PKG_CONFIG_PATH=${HOME}/.porg/$HOSTNAME/usr/lib/pkgconfig \
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
#  --enable-static \
#  LDFLAGS="-L${HOME}/.porg/$HOSTNAME/usr/lib" \
#  CFLAGS="-I${HOME}/.porg/$HOSTNAME/usr/include"
make -j4
porg -lD "make install"

## Check
porg tmux
cd ${HOME}

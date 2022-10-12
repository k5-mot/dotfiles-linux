#!/usr/bin/env bash

## tmux
## URL: https://github.com/tmux/tmux

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
    porg -r tmux > /dev/null 2>&1
fi
rm -rfv   $PORG_HOME/src/tmux > /dev/null 2>&1

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/tmux > /dev/null 2>&1
cd        ${HOME}/.porg/$HOSTNAME/src/tmux > /dev/null 2>&1

## Download
export TMUX_URL=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep "\"browser_download_url\": \"[^\"]*.tar.gz\"" | sed "s/\"browser_download_url\": //g" | sed "s/[\" ]//g") > /dev/null 2>&1
wget --no-check-certificate $TMUX_URL > /dev/null 2>&1
tar -zxvf tmux-*.tar.gz > /dev/null 2>&1
mv tmux-*.tar.gz tmux.tar.gz > /dev/null 2>&1
cd tmux-* > /dev/null 2>&1

## Install
PKG_CONFIG_PATH=${HOME}/.porg/$HOSTNAME/usr/lib/pkgconfig \
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr > /dev/null 2>&1
#  --enable-static \
#  LDFLAGS="-L${HOME}/.porg/$HOSTNAME/usr/lib" \
#  CFLAGS="-I${HOME}/.porg/$HOSTNAME/usr/include"
make -j4 > /dev/null 2>&1
porg -lD "make install" > /dev/null 2>&1

## Check
porg tmux
cd ${HOME} > /dev/null 2>&1

#!/usr/bin/env bash

## tmux
## URL: https://github.com/tmux/tmux

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
    porg -r tmux
fi
rm -rfv   $PORG_HOME/tmp/tmux* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/tmux  > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/tmux > /dev/null 2>&1
cd        $PORG_HOME/tmp

## Download
browser_download_url=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep "\"browser_download_url\": \"[^\"]*.tar.gz\"" | sed "s/\"browser_download_url\": //g" | sed "s/[\" ]//g")
wget --no-check-certificate $browser_download_url

## Extract
cd       $PORG_HOME/src/tmux
tar -xvf $PORG_HOME/tmp/tmux-*.tar.gz
cd       $PORG_HOME/src/tmux/tmux-*

## Install
PKG_CONFIG_PATH="$PORG_HOME/usr/lib/pkgconfig" \
./configure \
  --prefix=$PORG_HOME/usr \
  --enable-static \
  --enable-utf8proc \
  CFLAGS="-I$PORG_HOME/usr/include -I$PORG_HOME/usr/include/ncurses" \
  LDFLAGS="-L$PORG_HOME/usr/lib -L$PORG_HOME/usr/include -L$PORG_HOME/usr/include/ncurses" \
  LIBEVENT_CFLAGS="-I$PORG_HOME/usr/include" \
  LIBEVENT_LIBS="-L$PORG_HOME/usr/lib -levent" \
  LIBNCURSES_CFLAGS="-I$PORG_HOME/usr/include" \
  LIBNCURSES_LIBS="-L$PORG_HOME/usr/lib -lncurses"
#   --with-utf8proc=$PORG_HOME/usr \
#   --with-ncurses=$PORG_HOME/usr \
#   --with-libevent=$PORG_HOME/usr \
make
porg -lD "make install"

## Check
porg tmux
cd $HOME

#!/usr/bin/env bash

## ncurses
## Dependencies: libevent

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r ncurses
fi
rm -rfv   $PORG_HOME/tmp/ncurses* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/ncurses  > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/ncurses  > /dev/null 2>&1
cd        $PORG_HOME/tmp

## Download
browser_download_url="https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.3.tar.gz"
# browser_download_url="ftp://ftp.invisible-island.net/ncurses/ncurses.tar.gz"
wget --no-check-certificate $browser_download_url

## Extract
cd       $PORG_HOME/src/ncurses
tar -xvf $PORG_HOME/tmp/ncurses-*.tar.gz
cd       $PORG_HOME/src/ncurses/ncurses-*

## Install
#mkdir -pv \
#    $PORG_HOME/etc/terminfo \
#    $PORG_HOME/lib/terminfo \
#    $PORG_HOME/usr/share/terminfo > /dev/null 2>&1
./configure \
    --prefix=$PORG_HOME/usr \
    --enable-pc-files \
    --with-pkg-config=$PORG_HOME/usr/lib/pkgconfig
#    --with-pkg-config-libdir=$PORG_HOME/usr/lib/pkgconfig \
#    --disable-shared \
#    --with-default-terminfo-dir=$PORG_HOME/usr/share/terminfo \
#    --with-terminfo-dirs="$PORG_HOME/etc/terminfo:$PORG_HOME/lib/terminfo:$PORG_HOME/usr/share/terminfo" \
#    CFLAGS="-I$PORG_HOME/usr/include " \
#    CPPFLAGS="-I$PORG_HOME/usr/include " \
#    LDFLAGS="-L$PORG_HOME/usr/lib -L$PORG_HOME/usr/include " \
#    LIBS="-static-libgcc -Wl,-Bstatic,-levent,-levent_core,-levent_extra,-levent_openssl,-levent_pthreads,-Bdynamic "
#   --with-shared
#   --with-termlib
make
porg -lD "make install"

## Check
porg ncurses
cd $HOME

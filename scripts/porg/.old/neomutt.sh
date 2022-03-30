#!/usr/bin/env bash

## neomutt
cd $HOME
cd $HOME/.porg/src
if (type "porg" > /dev/null 2>&1); then
  porg -r neomutt
fi
rm -rf $HOME/.porg/src/neomutt
git clone --verbose --progress https://github.com/neomutt/neomutt.git
cd $HOME/.porg/src/neomutt

./configure --prefix=$HOME/.porg/usr \
  --with-ncurses=$HOME/.porg/usr \
  --disable-idn \
  --idn2 \
  --with-idn2=$HOME/.porg/usr
make
porg -lD make install
porg neomutt
cd $HOME


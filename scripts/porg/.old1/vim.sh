#!/usr/bin/env bash

## vim
## https://www.vim.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r vim
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/vim

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/vim
cd        ${HOME}/.porg/$HOSTNAME/src/vim

## Download
git clone https://github.com/vim/vim.git
cd vim/src

## Install
LDFLAGS="-Wl,-rpath=${HOME}/.porg/$HOSTNAME/usr/lib" ./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --with-python3-command=${HOME}/.porg/$HOSTNAME/usr/bin/python3 \
  --with-python3-config-dir=$(python3-config --configdir) \
  --with-ruby-command=${HOME}/.porg/$HOSTNAME/usr/bin/ruby \
  --with-lua-prefix=${HOME}/.porg/$HOSTNAME/usr \
  --enable-shared \
  --enable-cscope \
  --enable-terminal \
  --enable-fontset \
  --enable-multibyte \
  --enable-nls \
  --enable-fail-if-missing \
  --enable-python3interp \
  --enable-pythoninterp \
  --enable-rubyinterp \
  --enable-luainterp \
  --with-features=huge \
  --enable-xim \
  --enable-gpm \
  --with-x \
  --enable-gui=auto \
  --enable-gtk2-check \
  --enable-gnome-check
make
export VIM_VERSION=$(./vim --version | head -1 | awk '{print $5}')
porg -lp vim-${VIM_VERSION} "make install prefix=${HOME}/.porg/$HOSTNAME/usr"

## Check
porg vim
cd ${HOME}/

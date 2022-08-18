#!/usr/bin/env bash

## fish
## https://github.com/fish-shell/fish-shell.git

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r fish
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/fish

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/fish
cd        ${HOME}/.porg/$HOSTNAME/src/fish

# Download
git clone https://github.com/fish-shell/fish-shell.git
cd fish-shell/

# Install
mkdir -pv build
cd build/
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$HOME/.porg/$HOSTNAME/usr
make
porg -lp fish "make install"

# Check package.
porg fish
cd ${HOME}/

#!/usr/bin/env bash

## Make

# Change dir.
cd $HOME
cd $HOME/.porg/src

# Remove package.
if (type "porg" > /dev/null 2>&1); then
  porg -r make
fi
rm -rf $HOME/.porg/src/make

# Download package.
wget http://ftp.gnu.org/gnu/make/make-4.3.tar.gz
wget http://ftp.gnu.org/gnu/make/make-4.3.tar.gz.sig
tar -zxvf make-*.tar.gz
cd make-*/

# Install package.
./configure \
  --prefix=$HOME/.porg/usr
make
porg -lD "make install"

# Check package.
porg make


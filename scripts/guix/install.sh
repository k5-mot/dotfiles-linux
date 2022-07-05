#!/usr/bin/env bash

##
## Guix
## https://guix.gnu.org/
##

## Remove
export HOSTNAME=$(hostname -s)
rm -rfv   ${HOME}/.local/src/guix

## Setup
mkdir -pv ${HOME}/.local/src/guix
cd        ${HOME}/.local/src/guix

## Download
git clone --verbose git://git.savannah.gnu.org/guix.git
cd guix
# wget --no-check-certificate https://ftp.gnu.org/gnu/guix/guix-binary-1.3.0.x86_64-linux.tar.xz
# wget --no-check-certificate https://ftp.gnu.org/gnu/guix/guix-binary-1.3.0.x86_64-linux.tar.xz.sig
# gpg --verify guix-binary-1.3.0.x86_64-linux.tar.xz.sig
# tar -xvf guix-binary-*.tar.xz

## Install
./bootstrap
./configure --prefix="${HOME}/.local/guix"
make


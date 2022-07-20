#!/usr/bin/env bash

##
## nix
## https://nix.gnu.org/
##

## Setup
export HOSTNAME=$(hostname -s)
export NIX_ROOT=$HOME/.local/nix
export PERL5OPT="-I$NIX_ROOT/lib/perl -I$NIX_ROOT/lib64/perl5 -I$NIX_ROOT/lib/perl5 -I$NIX_ROOT/lib/perl5/site_perl"
mkdir -pv ${HOME}/.local/src/nix
cd        ${HOME}/.local/src/nix && pwd

chmod 777 $(find ${HOME}/.local/nix -type d)
rm -rfv   ${HOME}/.local/nix
mkdir -pv ${HOME}/.local/nix
# cd        ${HOME}/.local/nix

## Download
wget --no-check-certificate http://nixos.org/releases/nix/nix-1.6.1/nix-1.6.1.tar.xz
tar -xvf nix-*.tar.xz
cd nix-*/ && pwd

## Install
./configure \
  --prefix=$HOME/.local/nix \
  --with-store-dir=$HOME/.local/nix/store \
  --localstatedir=$HOME/.local/nix/var
make
make install
# git clone --verbose git://git.savannah.gnu.org/nix.git
# cd nix
# # wget --no-check-certificate https://ftp.gnu.org/gnu/nix/nix-binary-1.3.0.x86_64-linux.tar.xz
# # wget --no-check-certificate https://ftp.gnu.org/gnu/nix/nix-binary-1.3.0.x86_64-linux.tar.xz.sig
# # gpg --verify nix-binary-1.3.0.x86_64-linux.tar.xz.sig
# # tar -xvf nix-binary-*.tar.xz
#
# ## Install
# ./bootstrap
# ./configure --prefix="${HOME}/.local/nix"
# make


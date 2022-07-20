#!/usr/bin/env bash

##
## Guix
## https://guix.gnu.org/
##

## Setup
export HOSTNAME=$(hostname -s)

chmod 755 $(find ${HOME}/.local/src/guix -type d)
rm -rf    ${HOME}/.local/src/guix
mkdir -pv ${HOME}/.local/src/guix

chmod 755 $(find ${HOME}/.local/guix -type d)
rm -rf    ${HOME}/.local/guix
mkdir -pv ${HOME}/.local/guix
cd        ${HOME}/.local/guix
echo "cudir: $(pwd)"

mkdir -pv ${HOME}/.local/guix/bin
export GUIX_BIN=${HOME}/.local/guix/bin

## Download
wget --no-check-certificate https://proot.gitlab.io/proot/bin/proot -O $GUIX_BIN/proot
chmod +x $GUIX_BIN/proot
export PATH=$PATH:$GUIX_BIN

PROOT_NO_SECCOMP=1 proot --version

wget --no-check-certificate https://alpha.gnu.org/gnu/guix/guix-binary-0.13.0.x86_64-linux.tar.xz
tar -xf guix-binary-*.tar.xz
chmod 755 $(find ${HOME}/.local/guix -type d)

# PROOT_NO_SECCOMP=1 proot -r . gnu/store/*-bash-static-4.4.12/bin/bash
# ls gnu/store/*/bin/bash
PROOT_NO_SECCOMP=1 proot -r '.' -b /proc -b /dev -b /etc  -b /tmp gnu/store/vir3lrwqy50pr8fkaf3m091dgbrja2n6-guix-0.13.0/bin/guix-daemon
PROOT_NO_SECCOMP=1 proot -r '.' -b /proc/ gnu/store/vir3lrwqy50pr8fkaf3m091dgbrja2n6-guix-0.13.0/bin/guix package -A hello
PROOT_NO_SECCOMP=1 proot -r '.' -b /proc/ gnu/store/vir3lrwqy50pr8fkaf3m091dgbrja2n6-guix-0.13.0/bin/guix package -i hello

# export GUILE_MODULE_AVAILABLE=yes
# rm -rfv   ${HOME}/.local/src/guix
# mkdir -pv ${HOME}/.local/src/guix
# cd        ${HOME}/.local/src/guix
# git clone --verbose git://git.savannah.gnu.org/guix.git
# cd guix
# ./bootstrap
# GUILE_MODULE_AVAILABLE=yes \
# ./configure \
#   --prefix=$HOME/.local/guix \
#   --with-store-dir=$HOME/.local/guix/store \
#   --localstatedir=$HOME/.local/guix/var
# make

# git clone --verbose git://git.savannah.gnu.org/guix.git
# cd guix
# # wget --no-check-certificate https://ftp.gnu.org/gnu/guix/guix-binary-1.3.0.x86_64-linux.tar.xz
# # wget --no-check-certificate https://ftp.gnu.org/gnu/guix/guix-binary-1.3.0.x86_64-linux.tar.xz.sig
# # gpg --verify guix-binary-1.3.0.x86_64-linux.tar.xz.sig
# # tar -xvf guix-binary-*.tar.xz
#
# ## Install
# ./bootstrap
# ./configure --prefix="${HOME}/.local/guix"
# make


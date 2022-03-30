#!/usr/bin/env bash

## GIMP

# Change dir.
cd $HOME
cd $HOME/.local/src

# Remove package.
#if (type "porg" > /dev/null 2>&1); then
#  porg -r gimp
#fi
#rm    -rfv $HOME/.local/src/gimp
#mkdir -pv  $HOME/.local/src/gimp
cd         $HOME/.local/src/gimp

### Download firefox
## NOTE: https://code.visualstudio.com/updates/v1_52
#wget --trust-server-names "https://download.gimp.org/mirror/pub/gimp/v2.10/gimp-2.10.24.tar.bz2"
#tar -xvf gimp-*.tar.bz2
cd gimp-*

# Install package.
rm    -rfv $HOME/.local/opt/gimp
mkdir -pv  $HOME/.local/opt
#porg -lD
export PATH="$HOME/.local/usr/bin:$PATH"
export PKG_CONFIG_PATH="$HOME/.local/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="$HOME/.local/usr/lib:$LD_LIBRARY_PATH"
export ACLOCAL_FLAGS="-I $HOME/.local/usr/share/aclocal $ACLOCAL_FLAGS"
./configure \
  --prefix=$HOME/.local/usr
make
porg -lD "make install"

# Check package.
porg gimp
cd $HOME



#!/usr/bin/env bash

## VSCode
## https://code.visualstudio.com

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r vscode
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/gimp

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/gimp
cd        ${HOME}/.porg/$HOSTNAME/src/gimp

## Download
export URL="https://update.code.visualstudio.com/1.52.1/linux-x64/stable"
# export URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
wget --no-check-certificate --trust-server-names ${URL}
tar -xvf code-*.tar.gz

## Install.
rm -rf    ${HOME}/.porg/$HOSTNAME/opt/gimp-linux-x64
mkdir -pv ${HOME}/.porg/$HOSTNAME/opt
export VERSION=$(${HOME}/.porg/$HOSTNAME/src/gimp/VSCode-linux-x64/bin/code --version | head -1 | awk '{print $1}')
porg -lp vscode-${VERSION} "cp -rf ${HOME}/.porg/$HOSTNAME/src/vscode/VSCode-linux-x64 ${HOME}/.porg/$HOSTNAME/opt"

## Check
porg vscode
cd ${HOME}/

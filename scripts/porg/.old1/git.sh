#!/usr/bin/env bash

## Git
## https://github.com/git/git
## dependency: libcurl4-openssl-dev, libexpat1-dev, gettext

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r git
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/git

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/git
cd        ${HOME}/.porg/$HOSTNAME/src/git

# Download
export APPVER="2.33.1"
wget --no-check-certificate https://github.com/git/git/archive/v${APPVER}.tar.gz
tar -xzvf v${APPVER}.tar.gz
cd git-*/

# Install
make configure
./configure --prefix=${HOME}/.porg/$HOSTNAME/usr --with-openssl=${HOME}/.porg/$HOSTNAME/usr
make all doc info
porg -lD "make install install-doc install-html install-info"

# Check package.
porg git
cd ${HOME}/

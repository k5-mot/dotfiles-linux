#!/usr/bin/env bash

## Node.js
## https://nodejs.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r node
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/node

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/node
cd        ${HOME}/.porg/$HOSTNAME/src/node

## Download
# export VERSION="14.18.3"
export VERSION="16.13.2"
export URL="https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-x64.tar.gz"
wget --no-check-certificate ${URL}
tar -zxvf node-*.tar.gz
cd node-*/

## Install
porg -lp  node-${VERSION} "cp -rf bin/     ${HOME}/.porg/$HOSTNAME/usr"
porg -lp+ node-${VERSION} "cp -rf include/ ${HOME}/.porg/$HOSTNAME/usr"
porg -lp+ node-${VERSION} "cp -rf lib/     ${HOME}/.porg/$HOSTNAME/usr"
porg -lp+ node-${VERSION} "cp -rf share/   ${HOME}/.porg/$HOSTNAME/usr"

## Check
porg node

## Install
porg -lp+ node-${VERSION} "npm install --global npm"
porg -lp+ node-${VERSION} "npm install --global yarn"
porg -lp+ node-${VERSION} "npm install --global neovim"
porg -lp+ node-${VERSION} "npm install --global gtop"
npm list --global

cd ${HOME}


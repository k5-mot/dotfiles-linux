#!/usr/bin/env bash

## VSCode
## https://code.visualstudio.com

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r vscode
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/vscode

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/vscode
cd        ${HOME}/.porg/$HOSTNAME/src/vscode

## Download
# export URL="https://update.code.visualstudio.com/1.52.1/linux-x64/stable"
export URL="https://update.code.visualstudio.com/1.57.1/linux-x64/stable"
# export URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
wget --no-check-certificate --trust-server-names ${URL}
tar -xvf code-*.tar.gz

## Install.
rm -rf    ${HOME}/.porg/$HOSTNAME/opt/VSCode-linux-x64
mkdir -pv ${HOME}/.porg/$HOSTNAME/opt
export VERSION=$(${HOME}/.porg/$HOSTNAME/src/vscode/VSCode-linux-x64/bin/code --version | head -1 | awk '{print $1}')
# porg -lp vscode-${VERSION} "cp -rf ${HOME}/.porg/$HOSTNAME/src/vscode/VSCode-linux-x64 ${HOME}/.porg/$HOSTNAME/opt"
porg -lp vscode-${VERSION} "ln -sfv ${HOME}/.porg/$HOSTNAME/src/vscode/VSCode-linux-x64/bin/code ${HOME}/.porg/$HOSTNAME/usr/bin"

## Check
porg vscode
cd ${HOME}/


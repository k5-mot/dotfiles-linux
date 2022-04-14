#!/usr/bin/env bash

## neovim
## https://neovim.io/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r neovim
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/neovim

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/neovim
cd        ${HOME}/.porg/$HOSTNAME/src/neovim

# Download
wget --no-check-certificate "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
wget --no-check-certificate "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage.sha256sum"
wget --no-check-certificate "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage.zsync"

# Install
chmod 755 nvim.appimage
porg -lp neovim "ln -sfv $(realpath nvim.appimage) ${HOME}/.porg/${HOSTNAME}/usr/bin/nvim"

# Check
porg neovim
cd $HOME


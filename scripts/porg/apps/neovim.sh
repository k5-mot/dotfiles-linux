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
export VERSION="0.5.1"
export URL="https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux64.tar.gz"
wget --no-check-certificate ${URL}
tar -zxvf nvim-linux64.tar.gz
cd nvim-linux64/
# git clone https://github.com/neovim/neovim.git
# cd neovim

# Install
porg -lp neovim-${VERSION} "cp -rf * ${HOME}/.porg/${HOSTNAME}/usr"
# git checkout stable
# make distclean
# VERBOSE=1 make CMAKE_BUILD_TYPE=Release
# export VERSION=$(./build/bin/nvim --version | head -1 | awk '{print $2}' | sed "s/v//g")
# porg -lp neovim-${VERSION} "make CMAKE_INSTALL_PREFIX=${HOME}/.porg/$HOSTNAME/usr install"

# Check
porg neovim
cd ${HOME}


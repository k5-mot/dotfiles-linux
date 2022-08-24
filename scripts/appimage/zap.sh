#!/usr/bin/env bash

##
## ⚡ Zap
##   The delightful package manager for AppImages
##
## URL: https://zap.srev.in/
## GitHub URL: https://github.com/srevinsaju/zap
##

## Setup
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME
if command -v zap &> /dev/null; then
    zap remove nvim
    zap remove tmux
fi
mkdir -pv $HOME/.local/bin
rm -rfv   $HOME/.local/bin/zap

## Download
wget --no-check-certificate \
  https://github.com/srevinsaju/zap/releases/download/continuous/zap-amd64 \
  -O $HOME/.local/bin/zap
chmod +x $HOME/.local/bin/zap

## Check
zap --help

## Install AppImage via zap
if command -v zap &> /dev/null; then
    echo "Installed zap"
    zap install --github --from neovim/neovim            --executable nvim
    zap install --github --from nelsonenzo/tmux-appimage --executable tmux
fi


#!/usr/bin/env bash

## Alacritty

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r alacritty
fi
rm -rfv   ${HOME}/.porg/$HOSTNAME/src/alacritty

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/alacritty
cd        ${HOME}/.porg/$HOSTNAME/src/alacritty

## Download
git clone https://github.com/alacritty/alacritty.git
cd alacritty/

## Install
rustup override set stable
rustup update stable
# cargo build --release
cargo build --release
infocmp alacritty
porg -lp alacritty "ln -s ${HOME}/.porg/$HOSTNAME/src/alacritty/alacritty/target/release/alacritty ${HOME}/.porg/$HOSTNAME/usr/bin"

## Check
porg alacritty
cd ${HOME}


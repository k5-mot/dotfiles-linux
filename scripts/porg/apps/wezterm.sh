#!/usr/bin/env bash

## wezterm

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r wezterm
fi
rm -rfv   ${HOME}/.porg/${HOSTNAME}/src/wezterm

## Setup
mkdir -pv ${HOME}/.porg/${HOSTNAME}/src/wezterm
cd        ${HOME}/.porg/${HOSTNAME}/src/wezterm

if [[ true ]]; then
  ## Download
  git clone --depth=1 --branch=main --recursive https://github.com/wez/wezterm.git
  cd wezterm
  git submodule update --init --recursive
  ## Install
  rustup override set stable
  rustup update stable
  # ./get-deps
  cargo build --release --no-default-features
  cargo run --release --bin wezterm -- start
  porg -lp wezterm "ln -sfv ${HOME}/.porg/${HOSTNAME}/src/wezterm/wezterm/target/release/wezterm ${HOME}/.porg/${HOSTNAME}/usr/bin"
else
  curl -LO https://github.com/wez/wezterm/releases/download/20220408-101518-b908e2dd/WezTerm-20220408-101518-b908e2dd-Ubuntu18.04.AppImage
  chmod +x WezTerm-20220408-101518-b908e2dd-Ubuntu18.04.AppImage
  porg -lp wezterm "ln -sfv $(realpath *.AppImage) ${HOME}/.porg/${HOSTNAME}/usr/bin/wezterm"
fi

## Check
porg wezterm
cd ${HOME}


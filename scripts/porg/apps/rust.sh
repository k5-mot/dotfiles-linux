#!/usr/bin/env bash

## Rust

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r rust
fi
rm -rfv $CARGO_HOME
rm -rfv $RUSTUP_HOME

## Install
porg -lp rust "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
export CARGO_ROOT=$XDG_CONFIG_HOME/cargo
export RUSTUP_HOME="$XDG_CACHE_HOME/rustup"
if [ -e $CARGO_ROOT ]; then
  export PATH=$CARGO_ROOT/bin:$PATH
fi
cargo install exa
cargo install bat
cargo install hexyl
cargo install procs
cargo install ripgrep

## Check
porg rust
cd ${HOME}


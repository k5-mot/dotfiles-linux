#!/usr/bin/env bash

##
## Rust
##
export CARGO_ROOT=$XDG_CONFIG_HOME/cargo
if [ -e $CARGO_ROOT ]; then
  export PATH=$CARGO_ROOT/bin:$PATH
fi

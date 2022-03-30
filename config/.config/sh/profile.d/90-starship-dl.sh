#!/usr/bin/env bash

##
## Starship
##
if [ ! -d $XDG_CACHE_HOME/starship ] || [ ! -x $XDG_CACHE_HOME/starship/starship ]; then
  mkdir -p $XDG_CACHE_HOME/starship
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir=$XDG_CACHE_HOME/starship -V -y
fi

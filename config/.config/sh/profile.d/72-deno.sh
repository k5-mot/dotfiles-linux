#!/usr/bin/env bash

##
## Deno
##
export DENO_INSTALL=$XDG_CONFIG_HOME/deno
if [ -e $DENO_INSTALL ]; then
  export PATH=$DENO_INSTALL/bin:$PATH
fi

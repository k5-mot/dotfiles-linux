#!/usr/bin/env bash

##
## Anyenv
##
export ANYENV_ROOT=$XDG_CONFIG_HOME/.anyenv
if [ -e $ANYENV_ROOT ]; then
  export PATH="$ANYENV_ROOT/bin:$PATH"
  if command -v anyenv 1>/dev/null 2>&1; then
    eval "$(anyenv init -)"
    #for D in `ls $HOME/.anyenv/envs`
    #do
    #  export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    #done
  fi
fi

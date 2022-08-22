#!/usr/bin/env bash

export HOSTNAME=$(hostname -s)
export LOCAL_ROOT=$HOME/.local
export FLATPAK_ROOT=$HOME/.local/flatpak

if [ -e $LOCAL_ROOT ]; then
  export PATH=$LOCAL_ROOT/bin:$PATH
fi
if command -v flatpak &> /dev/null; then
  if [ -e $FLATPAK_ROOT ]; then
    export PATH=$FLATPAK_ROOT/bin:$PATH
  fi
fi


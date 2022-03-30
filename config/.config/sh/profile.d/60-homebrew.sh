#!/usr/bin/env bash

##
## Homebrew
##
export HOMEBREW_ROOT=$XDG_CONFIG_HOME/linuxbrew
if [ -e $HOMEBREW_ROOT ]; then
  export PATH=$HOMEBREW_ROOT/sbin:$HOMEBREW_ROOT/bin:$PATH
  export LD_LIBRARY_PATH=$HOMEBREW_ROOT/lib64:$HOMEBREW_ROOT/lib:$LD_LIBRARY_PATH
  export MANPATH=$HOMEBREW_ROOT/share/man:$MANPATH
  export INFOPATH=$HOMEBREW_ROOT/share/info:$INFOPATH
  export XDG_DATA_DIRS=$HOMEBREW_ROOT/share:$XDG_DATA_DIRS
  # Optional
  # export HOMEBREW_NO_ENV_FILTERING=1
  # export HOMEBREW_DEVELOPER=1
  # export HOMEBREW_CURL_PATH=$HOME/.local/usr/bin/curl
  # export HOMEBREW_GIT_PATH=$HOME/.local/usr/bin/git
  eval "$($HOMEBREW_ROOT/bin/brew shellenv)"
fi

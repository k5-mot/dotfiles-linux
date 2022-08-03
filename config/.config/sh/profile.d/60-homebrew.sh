#!/usr/bin/env bash

##
## Homebrew
##

# export HOMEBREW_ROOT=${XDG_DATA_HOME:-${HOME}/.local/share}/linuxbrew
# mkdir -pv ${XDG_DATA_HOME:-${HOME}/.local/share}
#
# if ! command -v brew &> /dev/null; then
#   if [ -d $HOMEBREW_ROOT ]; then
#     rm -rfv $HOMEBREW_ROOT
#   fi
#   git clone --verbose https://github.com/Homebrew/brew $HOMEBREW_ROOT
#   eval "$($HOMEBREW_ROOT/bin/brew shellenv)"
#   brew update --force --quiet
#   chmod -R go-w "$(brew --prefix)/share/zsh"
# fi
#
# if command -v brew &> /dev/null; then
#   # export PATH=$HOMEBREW_ROOT/sbin:$HOMEBREW_ROOT/bin:$PATH
#   # export LD_LIBRARY_PATH=$HOMEBREW_ROOT/lib64:$HOMEBREW_ROOT/lib:$LD_LIBRARY_PATH
#   # export MANPATH=$HOMEBREW_ROOT/share/man:$MANPATH
#   # export INFOPATH=$HOMEBREW_ROOT/share/info:$INFOPATH
#   # export XDG_DATA_DIRS=$HOMEBREW_ROOT/share:$XDG_DATA_DIRS
#   # Optional
#   # export HOMEBREW_NO_ENV_FILTERING=1
#   # export HOMEBREW_DEVELOPER=1
#   # export HOMEBREW_CURL_PATH=$HOME/.local/usr/bin/curl
#   # export HOMEBREW_GIT_PATH=$HOME/.local/usr/bin/git
#   eval "$($HOMEBREW_ROOT/bin/brew shellenv)"
# fi

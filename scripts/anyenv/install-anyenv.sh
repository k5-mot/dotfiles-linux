#!/usr/bin/env bash

set -eu
cd $HOME

## Configure anyenv variable
export PATH=$ANYENV_ROOT/bin:$PATH
export ANYENV_ROOT=$HOME/.anyenv
export ANYENV_PLUGINS=$ANYENV_ROOT/plugins

## Download anyenv
if [ ! -e $ANYENV_ROOT ]; then
  git clone https://github.com/anyenv/anyenv $ANYENV_ROOT
fi

## Load anyenv
eval "$($ANYENV_ROOT/bin/anyenv init)"

## Initialize anyenv
eval "$(anyenv install --init)"
eval "$(anyenv install --init https://github.com/foo/anyenv-install.git)"

## Set up anyenv.
if [ -e $ANYENV_ROOT ]; then
  mkdir -p $ANYENV_PLUGINS
  if [ ! -e $ANYENV_PLUGINS/anyenv-update ]; then
    git clone --verbose --progress https://github.com/znz/anyenv-update.git $ANYENV_PLUGINS/anyenv-update
  fi
  if [ ! -e $ANYENV_PLUGINS/anyenv-git ]; then
    git clone --verbose --progress https://github.com/znz/anyenv-git.git $ANYENV_PLUGINS/anyenv-git
  fi
fi

## Check version.
anyenv --version
anyenv install --list

#!/usr/bin/env bash

set -eu
cd $HOME

## Install nodenv via anyenv
anyenv install --skip-existing nodenv

## Install plugins for nodenv.
if [ ! -e $ANYENV_ROOT/envs/nodenv/plugins/node-build ]; then
  git clone https://github.com/nodenv/node-build.git $ANYENV_ROOT/envs/nodenv/plugins/node-build
fi
if [ ! -e $ANYENV_ROOT/envs/nodenv/plugins/nodenv-update ]; then
  git clone https://github.com/nodenv/nodenv-update.git $ANYENV_ROOT/envs/nodenv/plugins/nodenv-update
fi

## Update anyenv
anyenv update
nodenv update

## Get latest version
export NODENV_NODEJS_VERSION=$(nodenv install --list | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | tail -1)
echo "Node.js : $NODENV_NODEJS_VERSION"

## Install latest version
CONFIGURE_OPTS="--enable-shared" nodenv install --skip-existing $NODENV_NODEJS_VERSION
nodenv versions

## Install packages of Node.js
nodenv global $NODENV_NODEJS_VERSION
npm update
npm install --global npm
npm install --global yarn
npm install --global neovim
npm list --global

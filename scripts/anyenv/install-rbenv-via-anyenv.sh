#!/usr/bin/env bash

set -eu
cd $HOME

## Install rbenv via anyenv
anyenv install --skip-existing rbenv

## Install plugins for rbenv.
if [ ! -e $ANYENV_ROOT/envs/rbenv/plugins/ruby-build ]; then
  git clone https://github.com/rbenv/ruby-build.git $ANYENV_ROOT/envs/rbenv/plugins/ruby-build
fi
if [ ! -e $ANYENV_ROOT/envs/rbenv/plugins/rbenv-update ]; then
  git clone https://github.com/rkh/rbenv-update.git $ANYENV_ROOT/envs/rbenv/plugins/rbenv-update
fi
if [ ! -e $ANYENV_ROOT/envs/rbenv/plugins/rbenv-default-gems ]; then
  git clone https://github.com/rbenv/rbenv-default-gems.git $ANYENV_ROOT/envs/rbenv/plugins/rbenv-default-gems
fi

## Update anyenv
anyenv update
rbenv update

## Get latest version
export RBENV_RUBY_VERSION=$(rbenv install --list-all | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | tail -1)
echo "Ruby    : $RBENV_RUBY_VERSION"

## Install latest version
CONFIGURE_OPTS="--enable-shared" rbenv install --skip-existing $RBENV_RUBY_VERSION
rbenv versions

## Install packages of rbenv
rbenv global $RBENV_RUBY_VERSION
gem update
gem update --system
gem install neovim
gem list

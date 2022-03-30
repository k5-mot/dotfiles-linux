#!/usr/bin/env bash

set -eu
cd $HOME

## Install pyenv via anyenv
anyenv install --skip-existing luaenv

## Install plugins for luaenv.
if [ ! -e $ANYENV_ROOT/envs/luaenv/plugins/lua-build ]; then
  git clone https://github.com/cehoffman/lua-build.git $ANYENV_ROOT/envs/luaenv/plugins/lua-build
fi

## Update anyenv
anyenv update
#luaenv update

## Get latest version
export LUAENV_LUA_VERSION=$(luaenv install --list | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | tail -1 | sed 's/^[ \t]*//')
echo "Lua     : $LUAENV_LUA_VERSION"

## Install latest version
CONFIGURE_OPTS="--enable-shared" luaenv install --skip-existing $LUAENV_LUA_VERSION
luaenv versions

## Lua
luaenv global $LUAENV_LUA_VERSION
lua -v

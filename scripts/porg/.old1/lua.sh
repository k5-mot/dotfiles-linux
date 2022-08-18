#!/usr/bin/env bash

## Lua
## https://www.lua.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r lua
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/lua

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/lua
cd        ${HOME}/.porg/$HOSTNAME/src/lua

## Download
export LUA_VERSION="5.4.3"
wget http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz
tar -zxvf lua-${LUA_VERSION}.tar.gz
cd lua-${LUA_VERSION}/

## Install 
make INSTALL_TOP=${HOME}/.porg/$HOSTNAME/usr
porg -lD "make install INSTALL_TOP=${HOME}/.porg/$HOSTNAME/usr"

## Check
porg lua
cd ${HOME}

#!/usr/bin/env bash

set -eu
set -x

rm -rf ~/.anyenv

./install-anyenv.sh
./install-pyenv-via-anyenv.sh
./install-rbenv-via-anyenv.sh
./install-nodenv-via-anyenv.sh
./install-luaenv-via-anyenv.sh
./install-plenv-via-anyenv.sh

exec $SHELL -l

#!/usr/bin/env bash

set -eu
cd $HOME

## Install pyenv via anyenv
anyenv install --skip-existing pyenv

## Install plugins for pyenv.
if [ ! -e $ANYENV_ROOT/envs/pyenv/plugins/pyenv-update ]; then
  git clone git://github.com/yyuu/pyenv-update.git $ANYENV_ROOT/envs/pyenv/plugins/pyenv-update
fi
if [ ! -e $ANYENV_ROOT/envs/pyenv/plugins/pyenv-virtualenv ]; then
  git clone https://github.com/yyuu/pyenv-virtualenv $ANYENV_ROOT/envs/pyenv/plugins/pyenv-virtualenv
fi
if [ ! -e $ANYENV_ROOT/envs/pyenv/plugins/pyenv-pip-update ]; then
  git clone https://github.com/massongit/pyenv-pip-update $ANYENV_ROOT/envs/pyenv/plugins/pyenv-pip-update
fi

## Update anyenv
anyenv update
pyenv update

## Get latest version
export PYENV_PYTHON2_VERSION=$(pyenv install --list | grep -v '[a-zA-Z]' | grep -e '2\.[0-9]*\.[0-9]*' | tail -1 | sed 's/^[ \t]*//')
export PYENV_PYTHON3_VERSION=$(pyenv install --list | grep -v '[a-zA-Z]' | grep -e '3\.[0-9]*\.[0-9]*' | tail -1 | sed 's/^[ \t]*//')
echo "Python2 : $PYENV_PYTHON2_VERSION"
echo "Python3 : $PYENV_PYTHON3_VERSION"

## Install latest version
CONFIGURE_OPTS="--enable-shared" pyenv install --skip-existing $PYENV_PYTHON2_VERSION
CONFIGURE_OPTS="--enable-shared" pyenv install --skip-existing $PYENV_PYTHON3_VERSION
pyenv versions

## Install packages of Python2
pyenv global $PYENV_PYTHON2_VERSION
pip install --upgrade pip
pip install pip-review
pip install neovim
pip-review --auto
pip list

## Install packages of Python3
pyenv global $PYENV_PYTHON3_VERSION
pip install --upgrade pip
pip install pip-review
pip install flake8
pip install autopep8
pip install neovim
pip install matplotlib
pip install numpy
pip install scipy
pip install compiledb
pip install openpyxl
pip install turtle
pip-review --auto
pip list

#!/usr/bin/env bash

set -eu
cd $HOME

## Install plenv via anyenv
anyenv install --skip-existing plenv

## Install plugins for plenv.
if [ ! -e $ANYENV_ROOT/envs/plenv/plugins/perl-build ]; then
  git clone https://github.com/tokuhirom/Perl-Build.git $ANYENV_ROOT/envs/plenv/plugins/perl-build
fi
#if [ ! -e $ANYENV_ROOT/envs/plenv/plugins/perl-install ]; then
#  git clone https://github.com/skaji/perl-install.git $ANYENV_ROOT/envs/plenv/plugins/perl-install
#fi
#if [ ! -e $ANYENV_ROOT/envs/plenv/plugins/plenv-download ]; then
#  git clone https://github.com/skaji/plenv-download.git $ANYENV_ROOT/envs/plenv/plugins/plenv-download
#fi

## Update anyenv
anyenv update
#plenv update

## Get latest version
export PLENV_PERL_VERSION=$(plenv install --list | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | head -1 | sed 's/^[ \t]*//')
echo "Perl    : $PLENV_PERL_VERSION"

## Install latest version
CONFIGURE_OPTS="--enable-shared" plenv install $PLENV_PERL_VERSION -Dusedevel
plenv versions

## Install packages of Perl
plenv global $PLENV_PERL_VERSION
plenv install-cpanm
cpanm Unicode::Japanese
cpanm Neovim::Ext

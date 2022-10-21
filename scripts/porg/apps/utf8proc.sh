#!/usr/bin/env bash

## libevent

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r utf8proc
fi
rm -rfv   $PORG_HOME/tmp/utf8proc > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/utf8proc > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/utf8proc > /dev/null 2>&1
cd        $PORG_HOME/tmp

## Download
cd        $PORG_HOME/src
git clone --verbose https://github.com/JuliaStrings/utf8proc.git
cd        $PORG_HOME/src/utf8proc
tag_name=$(git tag | grep -o -E "([0-9]+\.){1}[0-9]+(\.[0-9]+)?" | sort --reverse | head -1)
git checkout -b v$tag_name refs/tags/v$tag_name

## Install
make prefix=$PORG_HOME/usr
porg -lp utf8proc-$tag_name "make install prefix=$PORG_HOME/usr"
make check

## Check
porg utf8proc
cd $HOME

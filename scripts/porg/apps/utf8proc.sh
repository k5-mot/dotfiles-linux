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
git checkout -b v2.7.0 refs/tags/v2.7.0

## Install
make prefix=$PORG_HOME/usr
porg -lD "make install prefix=$PORG_HOME/usr"
make check

## Check
porg utf8proc
cd $HOME

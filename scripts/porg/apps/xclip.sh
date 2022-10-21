#!/usr/bin/env bash

## xclip

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r xclip
fi
rm -rfv   $PORG_HOME/tmp/xclip* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/xclip  > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/xclip > /dev/null 2>&1
cd        $PORG_HOME/tmp

## Download
cd       $PORG_HOME/src
git clone --verbose https://github.com/astrand/xclip.git
cd       $PORG_HOME/src/xclip
tag_name=$(git tag | sort --reverse | head -1)
git checkout -b $tag_name refs/tags/$tag_name

## Install
autoconf
./configure --prefix=$PORG_HOME/usr
make
porg -lp xclip-$tag_name "make install && make install.man"

## Check
porg xclip
cd $HOME


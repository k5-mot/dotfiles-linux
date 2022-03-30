#!/usr/bin/env bash

## spin

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r spin
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/spin

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/spin
cd        ${HOME}/.porg/$HOSTNAME/src/spin

## Download
git clone https://github.com/nimble-code/Spin.git
cd Spin/Src

## Install
make DESTDIR=${HOME}/.porg/$HOSTNAME/usr
export VERSION=$(./spin -V | awk '{print $3}')
porg -lp  spin-${VERSION} "make install DESTDIR=${HOME}/.porg/$HOSTNAME/usr"
porg -lp+ spin-${VERSION} "ln -s ${HOME}/.porg/$HOSTNAME/src/spin/Spin/optional_gui/ispin.tcl ${HOME}/.porg/$HOSTNAME/usr/bin"

## Check
porg spin
cd ${HOME}

#!/usr/bin/env bash

##
## pkgsrc
## https://www.pkgsrc.org/
##

## Download
rm -rfv   $HOME/.local/pkg
mkdir -pv $HOME/.local/pkg
cd        $HOME/.local/pkg && pwd
wget --no-check-certificate https://cdn.netbsd.org/pub/pkgsrc/stable/pkgsrc.tar.xz
tar -xvf pkgsrc.tar.xz

## Setup
export SH=$(which bash)
cd pkgsrc/bootstrap
./bootstrap --unprivileged

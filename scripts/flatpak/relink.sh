#!/usr/bin/env bash

##
## Flatpak
## https://flatpak.org/
## https://flathub.org/
##

## Setup
flatpak update --user --assumeyes
export FLATPAK_BINDIR=$HOME/.local/flatpak/bin
rm -rf    $FLATPAK_BINDIR
mkdir -pv $FLATPAK_BINDIR

## Install
for applink in $(ls $SRCDIR/*); do
  apppath=$(readlink -f $applink)
  appname=$(basename $apppath | awk -F"." '{print tolower($NF)}')
  ln -sfv $apppath $FLATPAK_BINDIR/$appname
done




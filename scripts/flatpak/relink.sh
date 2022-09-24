#!/usr/bin/env bash

##
## Flatpak
## https://flatpak.org/
## https://flathub.org/
##

## Setup
export FLATPAK_BINDIR=$HOME/.local/flatpak/bin
rm    -rfv $FLATPAK_BINDIR
mkdir -pv  $FLATPAK_BINDIR

## Install
for applink in $(ls $HOME/.local/share/flatpak/exports/bin/*); do
    apppath=$(readlink -f $applink)
    appname=$(basename $apppath | awk -F"." '{print tolower($NF)}')
    # echo "$appname $apppath"
    ln -sfv $apppath $FLATPAK_BINDIR/$appname
done

if [ -x $HOME/.local/share/flatpak/exports/bin/org.eclipse.Java ]; then 
    ln -sfv $HOME/.local/share/flatpak/exports/bin/org.eclipse.Java             $FLATPAK_BINDIR/eclipse
fi

if [ -x $HOME/.local/share/flatpak/exports/bin/io.github.shiftey.Desktop ]; then 
    ln -sfv $HOME/.local/share/flatpak/exports/bin/io.github.shiftey.Desktop    $FLATPAK_BINDIR/github-desktop
fi

if [ -x $HOME/.local/share/flatpak/exports/bin/com.spotify.Client ]; then 
    ln -sfv $HOME/.local/share/flatpak/exports/bin/com.spotify.Client           $FLATPAK_BINDIR/spotify
fi

if [ -x $HOME/.local/share/flatpak/exports/bin/org.processing.processingide ]; then 
    ln -sfv $HOME/.local/share/flatpak/exports/bin/org.processing.processingide $FLATPAK_BINDIR/processing
fi


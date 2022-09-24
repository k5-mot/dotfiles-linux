#!/usr/bin/env bash

## Google Chrome
## https://www.google.com/chrome/

export HOSTNAME=$(hostname -s)
export STOW_HOME=$HOME/.local/xstow/$HOSTNAME

# Remove
rm -rfv   $STOW_HOME/tmp/google-chrome-*
rm -rfv   $STOW_HOME/{src,pkg}/chrome
mkdir -pv $STOW_HOME/{src,pkg}/chrome

## Download
cd        $STOW_HOME/tmp
echo "PWD: $(pwd)"
wget --no-check-certificate "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

## Extract
cd        $STOW_HOME/pkg/chrome
echo "PWD: $(pwd)"
rpm2cpio $STOW_HOME/tmp/google-chrome-stable_current_x86_64.rpm | cpio -idv

## Install
cd $STOW_HOME/pkg/chrome
echo "PWD: $(pwd)"
dirs=$(find . -type d)
for dir in $dirs; do 
    mkdir -pv $STOW_HOME/$dir
done
cd        $STOW_HOME/pkg
echo "PWD: $(pwd)"
xstow -v chrome 
if [ $? = 0 ]; then
    echo "Success $?"
else
    echo "Failed $?"
fi

## Check
cd $HOME


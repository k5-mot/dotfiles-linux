#!/usr/bin/env bash

## Google Chrome
## URL: https://www.google.com/chrome/

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
    porg -r google-chrome > /dev/null 2>&1
fi
rm -rfv   $PORG_HOME > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/{tmp,src}/chrome > /dev/null 2>&1
cd        $PORG_HOME/tmp/chrome > /dev/null 2>&1

## Download
export URL="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
wget --no-check-certificate $URL > /dev/null 2>&1

## Install
cd        $PORG_HOME > /dev/null 2>&1
porg -lp  google-chrome "rpm2cpio ./tmp/chrome/google-chrome-stable_current_x86_64.rpm | cpio -idv" > /dev/null 2>&1
porg -lp+ google-chrome "rm -rfv $PORG_HOME/usr/bin/google-chrome-stable" > /dev/null 2>&1
porg -lp+ google-chrome "ln -sv  $PORG_HOME/opt/google/chrome/google-chrome $PORG_HOME/usr/bin/google-chrome-stable" > /dev/null 2>&1

## Check
porg google-chrome
cd $HOME > /dev/null 2>&1


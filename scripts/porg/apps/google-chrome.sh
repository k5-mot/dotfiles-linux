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
rm -rfv   $PORG_HOME/tmp/google-chrome-* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/google-chrome   > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/google-chrome   > /dev/null 2>&1
cd        $PORG_HOME/tmp                

# Download
browser_download_url="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
wget --no-check-certificate $browser_download_url 

## Extract
cd        $PORG_HOME/src/google-chrome
rpm2cpio  $PORG_HOME/tmp/google-chrome-*.rpm | cpio -idv

## Install
cd        $PORG_HOME 
porg -lp google-chrome "ln -sv $PORG_HOME/src/google-chrome/opt/google/chrome/google-chrome $PORG_HOME/usr/bin/google-chrome-stable" > /dev/null 2>&1

## Check
echo -e "\e[34mInstalled\e[m"
porg google-chrome
cd $HOME


#!/usr/bin/env bash

## Google Chrome
## URL: https://www.google.com/chrome/

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
    porg -r sidekick > /dev/null 2>&1
fi
rm -rfv   $PORG_HOME/tmp/sidekick-* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/sidekick   > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/sidekick   > /dev/null 2>&1
cd        $PORG_HOME/tmp

# Download
browser_download_url="https://api.meetsidekick.com/downloads/df/linux/rpm?aid=9e14dd58-6be4-407b-a992-8d60f6457c17"
wget --no-check-certificate $browser_download_url -O sidekick.rpm

## Extract
cd        $PORG_HOME/src/sidekick
rpm2cpio  $PORG_HOME/tmp/sidekick.rpm | cpio -idv

## Install
cd        $PORG_HOME
porg -lp sidekick "ln -sv $PORG_HOME/src/sidekick/opt/meetsidekick.com/sidekick/sidekick-browser $PORG_HOME/usr/bin/sidekick-browser" > /dev/null 2>&1

## Check
echo -e "\e[34mInstalled\e[m"
porg sidekick
cd $HOME


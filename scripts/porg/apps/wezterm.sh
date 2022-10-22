#!/usr/bin/env bash

## Google Chrome
## URL: https://www.google.com/chrome/

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
    porg -r wezterm > /dev/null 2>&1
fi
rm -rfv   $PORG_HOME/tmp/wezterm-* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/wezterm   > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/wezterm   > /dev/null 2>&1
cd        $PORG_HOME/tmp

# Download
browser_download_url="https://github.com/wez/wezterm/releases/download/20220905-102802-7d4b8249/wezterm-20220905_102802_7d4b8249-1.centos7.x86_64.rpm"
wget --no-check-certificate $browser_download_url

## Install
cd        $PORG_HOME
porg -lp wezterm "rpm2cpio $PORG_HOME/tmp/wezterm-*.rpm | cpio -idv"

## Check
echo -e "\e[34mInstalled\e[m"
porg wezterm
cd $HOME


#!/usr/bin/env bash

## Discord
## https://discord.com/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r discord
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/discord

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/discord
cd        ${HOME}/.porg/$HOSTNAME/src/discord

## Download
export URL="https://discord.com/api/download?platform=linux&format=tar.gz"
wget --no-check-certificate --content-disposition ${URL}
tar -zxvf discord-*.tar.gz
cd Discord/

## Install
porg -lp discord "ln -sfv $(realpath Discord) ${HOME}/.porg/$HOSTNAME/usr/bin/discord"

## Check
porg discord


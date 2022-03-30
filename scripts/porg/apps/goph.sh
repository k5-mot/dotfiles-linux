#!/usr/bin/env bash

## Goph
## https://github.com/Mayccoll/Gogh

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r goph
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/goph

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/goph
cd        ${HOME}/.porg/$HOSTNAME/src/goph

# Download
porg -lp  goph git clone https://github.com/Mayccoll/Gogh.git goph
cd goph/themes

# Install
export TERMINAL=gnome-terminal
./atom.sh
./dracula.sh
./one-dark.sh

# Check
porg goph
cd ${HOME}


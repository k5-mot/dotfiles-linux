#!/bin/sh

## Install extensions for VSCode.
cat $1 | while read extension
do
  code --install-extension ${extension} &> /dev/null
  echo "Installed ${extension}"
done

## Check extensions for VSCode.
echo ""
code --list-extensions


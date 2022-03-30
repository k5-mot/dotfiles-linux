#!/usr/bin/env bash

## Deno

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r deno
fi
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/deno
cd        ${HOME}/.porg/$HOSTNAME/src/deno

## Install
porg -lp deno "curl -fsSL https://deno.land/install.sh | sh"

## Check
porg deno
cd ${HOME}


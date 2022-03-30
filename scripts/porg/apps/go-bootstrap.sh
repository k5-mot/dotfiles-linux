#!/usr/bin/env bash

## Golang
## https://go.dev/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r go-1.4
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/go-bootstrap

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/go-bootstrap
cd        ${HOME}/.porg/$HOSTNAME/src/go-bootstrap

## Download
wget --no-check-certificate https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz
tar -zxvf go*.tar.gz
cd        go/src

## Install
porg -lp go-1.4 "CGO_ENABLED=0 bash ./all.bash"

## Check
porg go-1.4
cd ${HOME}/


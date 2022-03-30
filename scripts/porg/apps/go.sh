#!/usr/bin/env bash

## Golang
## https://go.dev/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r go
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/go

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/go
cd        ${HOME}/.porg/$HOSTNAME/src/go

## Download
export VERSION="1.17.3"
# wget --no-check-certificate https://go.dev/dl/go${VERSION}.src.tar.gz
wget --no-check-certificate https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz
tar -zxvf go*.tar.gz
# cd        go*/src
cd        go/

## Install
# export GOROOT_BOOTSTRAP=${HOME}/.porg/src/go-bootstrap/go
porg -lp go-${VERSION} "ln -s ${HOME}/.porg/$HOSTNAME/src/go/go/bin/* ${HOME}/.porg/$HOSTNAME/usr/bin/"

## Check
porg go
cd ${HOME}/


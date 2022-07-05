#!/usr/bin/env bash

##
## Spack
## https://github.com/spack/spack
##

## Remove
export HOSTNAME=$(hostname -s)
rm -rfv   ${HOME}/.local/src/spack

## Setup
mkdir -pv ${HOME}/.local/src/spack
cd        ${HOME}/.local/src/spack

## Download
git clone -c feature.manyFiles=true https://github.com/spack/spack.git
cd spack/bin

## Install
./spack install zlib


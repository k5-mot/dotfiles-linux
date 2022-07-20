#!/usr/bin/env zsh

##
## Spack
## https://github.com/spack/spack
##

## Remove
export HOSTNAME=$(hostname -s)
rm -rfv   ${HOME}/.local/spack
# rm -rfv   ${HOME}/.spack/report

## Setup
mkdir -pv ${HOME}/.local/
cd        ${HOME}/.local/

## Download
git clone -c feature.manyFiles=true https://github.com/spack/spack.git
cd spack
git checkout releases/v0.18

## Install
export SPACK_ROOT=$HOME/.local/spack
# export PATH=$SPACK_ROOT/bin:$PATH
. $SPACK_ROOT/share/spack/setup-env.sh


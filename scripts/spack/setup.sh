#!/usr/bin/env zsh

##
## Spack
## https://github.com/spack/spack
##

## Remove
export HOSTNAME=$(hostname -s)
rm -rfv   ${HOME}/.local/spack
rm -rfv   ${HOME}/.spack
rm -rfv   ${HOME}/.config/spack

## Setup
mkdir -pv ${HOME}/.local/
cd        ${HOME}/.local/
echo "cd: $(pwd)"

## Download
git clone -c feature.manyFiles=true https://github.com/spack/spack.git
cd spack
echo "cd: $(pwd)"
git checkout releases/v0.18

## Install
export SPACK_ROOT=$HOME/.local/spack
. $SPACK_ROOT/share/spack/setup-env.sh
# spack config edit compilers
# spack mirror add binary_mirror  https://binaries.spack.io/releases/v0.18
# spack buildcache keys --install --trust
# spack buildcache list --allarch


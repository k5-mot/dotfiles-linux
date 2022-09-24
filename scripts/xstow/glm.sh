#!/usr/bin/env bash

## GLM
## https://glm.g-truc.net/0.9.9/
## https://github.com/g-truc/glm

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r glm
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/glm

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/glm
# mkdir -pv ${HOME}/.porg/usr/share/doc/glm
cd        ${HOME}/.porg/$HOSTNAME/src/glm

## Download
git clone https://github.com/g-truc/glm.git
cd    glm/
mkdir build
cd    build/

## Install
export VERSION=$(git tag | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*' | tail -1)
cmake -DCMAKE_INSTALL_PREFIX=${HOME}/.porg/$HOSTNAME/usr -DBUILD_STATIC_LIBS=OFF -DBUILD_SHARED_LIBS=OFF -DGLM_TEST_ENABLE=OFF ..
make
porg -lp glm-${VERSION} "make install"

## Check
porg glm
cd ${HOME}

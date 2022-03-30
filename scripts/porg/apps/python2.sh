#!/usr/bin/env bash

## Python2
## https://www.python.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r python-2
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/python2

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/python2
cd        ${HOME}/.porg/$HOSTNAME/src/python2

## Download
export VERSION="2.7.18"
export URL=https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
wget --no-check-certificate ${URL}
tar -zxvf Python-${VERSION}.tgz
cd Python-${VERSION}/

## Install
./configure --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lp  python-${VERSION} "make install"

## Check
porg Python-2*

## Install
porg -lp+ python-${VERSION} "curl -kL https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2"
porg -lp+ python-${VERSION} "python2 -m pip install --upgrade pip"
porg -lp+ python-${VERSION} "python2 -m pip install pip-review"
porg -lp+ python-${VERSION} "python2 -m pip install neovim"
porg -lp+ python-${VERSION} "python2 -m pip-review --auto"
python2 -m pip -V
python2 -m pip list

cd ${HOME}

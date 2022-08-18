#!/usr/bin/env bash

## labelImg
## https://github.com/tzutalin/labelImg

## Remove
export HOSTNAME=$(hostname -s)
# if (type "porg" > /dev/null 2>&1); then
#   porg -r labelImg
# fi
rm    -rf ${HOME}/.porg/$HOSTNAME/src/labelImg

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/labelImg
cd        ${HOME}/.porg/$HOSTNAME/src/labelImg

## Download
git clone https://github.com/tzutalin/labelImg.git
cd labelImg

## Install
export PYTHON_VERSION=$(python3 --version | awk '{print $2}')
#python3 -m pip install -r requirements/requirements-linux-python3.txt
porg -lp+ python-${PYTHON_VERSION} "python3 -m pip install --upgrade pip"
porg -lp+ python-${PYTHON_VERSION} "python3 -m pip install pyqt5 lxml"
porg -lp+ python-${PYTHON_VERSION} "make qt5py3 && make test"

## Check
# porg labelImg
cd ${HOME}


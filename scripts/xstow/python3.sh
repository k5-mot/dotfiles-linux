#!/usr/bin/env bash

## Python3
## https://www.python.org/
## Dependencies: openssl

## Remove
export HOSTNAME=$(hostname -s)
export STOW_HOME=$HOME/.local/xstow/$HOSTNAME
rm -rf    ${HOME}/.porg/$HOSTNAME/src/python3

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/python3
cd        ${HOME}/.porg/$HOSTNAME/src/python3

## Download
# export VERSION="3.8.12"
# export VERSION="3.10.1"
export VERSION="3.9.9"
export URL="https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz"
wget --no-check-certificate ${URL}
tar -zxvf Python-*.tgz
cd Python-*/

## Install
sed -i 's/#SSL=\/usr\/local\/ssl/SSL=\/usr\/local\/ssl/g' Modules/Setup
sed -i 's/#_ssl _ssl.c \\/_ssl _ssl.c \\/g' Modules/Setup
sed -i 's/#	-DUSE_SSL -I\$(SSL)\/include -I\$(SSL)\/include\/openssl \\/	-DUSE_SSL -I\$(SSL)\/include -I\$(SSL)\/include\/openssl \\/g' Modules/Setup
sed -i 's/#	-L\$(SSL)\/lib -lssl -lcrypto/	-L\$(SSL)\/lib -lssl -lcrypto/g' Modules/Setup
export LDFLAGS="-L${HOME}/.porg/$HOSTNAME/usr/lib"
export CPPFLAGS="-I${HOME}/.porg/$HOSTNAME/usr/include -I${HOME}/.porg/$HOSTNAME/usr/include/ncurses"
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --enable-shared
#	--with-openssl=${HOME}/.porg/$HOSTNAME/usr
#  --with-ensurepip \
#  --enable-ipv6 \
#  --enable-optimizations \
#  --enable-shared \
#  --enable-threads \
#  --with-lto
make
porg -lp python-${VERSION} "make install"

## Check
porg python-${VERSION}
python3 --version
# python3 -m test

## Install
# export PATH=$HOME/.local/bin:$PATH
# porg -lp+ python-${VERSION} "curl -kL https://bootstrap.pypa.io/get-pip.py | python3"
porg -lp+ python-${VERSION} "python3 -m pip install --upgrade pip"
porg -lp+ python-${VERSION} "python3 -m pip install pip-review"
porg -lp+ python-${VERSION} "python3 -m pip install flake8"
porg -lp+ python-${VERSION} "python3 -m pip install autopep8"
porg -lp+ python-${VERSION} "python3 -m pip install jupyter"
porg -lp+ python-${VERSION} "python3 -m pip install neovim"
porg -lp+ python-${VERSION} "python3 -m pip install rich-cli"
porg -lp+ python-${VERSION} "python3 -m pip install matplotlib"
porg -lp+ python-${VERSION} "python3 -m pip install numpy"
porg -lp+ python-${VERSION} "python3 -m pip install scipy"
# porg -lp+ python-${VERSION} "python3 -m pip install compiledb"
porg -lp+ python-${VERSION} "python3 -m pip install openpyxl"
porg -lp+ python-${VERSION} "python3 -m pip install turtle"
porg -lp+ python-${VERSION} "python3 -m pip install pandas"
porg -lp+ python-${VERSION} "python3 -m pip install torch"
porg -lp+ python-${VERSION} "python3 -m pip install torchvision"
porg -lp+ python-${VERSION} "python3 -m pip install tensorflow"
# porg -lp+ python-${VERSION} "python3 -m pip install powerline-status"
porg -lp+ python-${VERSION} "python3 -m pip-review --auto"

## Check
python3 -m pip -V
python3 -m pip list
cd ${HOME}


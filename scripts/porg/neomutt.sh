#!/usr/bin/env bash

##
## Neomutt
## 
## https://neomutt.org/
## https://github.com/neomutt/neomutt
##

export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME



## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r libidn2
fi
rm -rf    $PORG_HOME/{tmp,src}/libidn2
mkdir -pv $PORG_HOME/{tmp,src}/libidn2

## Download
cd        $PORG_HOME/tmp/libidn2
wget --no-check-certificate https://ftp.gnu.org/gnu/libidn/libidn2-2.3.3.tar.gz
wget --no-check-certificate https://ftp.gnu.org/gnu/libidn/libidn2-2.3.3.tar.gz.sig

## Extract
cd        $PORG_HOME/src/libidn2
tar -xvf  $PORG_HOME/tmp/libidn/libidn2-*.tar.gz
cd        $PORG_HOME/src/libidn/libidn2-*

## Install
./configure \
  --prefix=$PORG_HOME/usr
make
porg -lp libidn2 "make install"

## Check
if [ ! $? ]; then
	echo -e "\e[32;1mInstalled $(porg libidn2)\e[m"
else
	echo -e "\e[31;1mNot Installed\e[m"
fi
cd $HOME



## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r neomutt
fi
rm -rf    $PORG_HOME/src/neomutt

## Download
cd $PORG_HOME/src
git clone --verbose https://github.com/neomutt/neomutt.git 
cd $PORG_HOME/src/neomutt

## Install
./configure \
  --prefix=$PORG_HOME/usr \
  --disable-idn --idn2 \
  --with-idn2=$PORG_HOME/usr
make
porg -lp neomutt "make install"

## Check
if [ ! $? ]; then
	echo -e "\e[32;1mInstalled $(porg neomutt)\e[m"
else
	echo -e "\e[31;1mNot Installed\e[m"
fi
cd $HOME


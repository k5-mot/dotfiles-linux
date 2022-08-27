#!/usr/bin/env bash

##
## Newsboat
## 
## https://newsboat.org/
## https://github.com/newsboat/newsboat
##

export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME



## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r libxml2
fi
rm -rf    $PORG_HOME/{tmp,src}/libxml2
mkdir -pv $PORG_HOME/{tmp,src}/libxml2

# ## Download
# cd        $PORG_HOME/tmp/libxml2
# wget --no-check-certificate https://ftp.gnu.org/gnu/libidn/libxml2-2.3.3.tar.gz
# wget --no-check-certificate https://ftp.gnu.org/gnu/libidn/libxml2-2.3.3.tar.gz.sig
# 
# ## Extract
# cd        $PORG_HOME/src/libxml2
# tar -xvf  $PORG_HOME/tmp/libidn/libxml2-*.tar.gz
# cd        $PORG_HOME/src/libidn/libxml2-*

## Download
cd $PORG_HOME/src
git clone --verbose https://gitlab.gnome.org/GNOME/libxml2.git
cd $PORG_HOME/src/libxml2

## Install
./autogen.sh
./configure \
  --prefix=$PORG_HOME/usr
make
porg -lp libxml2 "make install"

## Check
if [ ! $? ]; then
	echo -e "\e[32;1mInstalled $(porg libxml2)\e[m"
else
	echo -e "\e[31;1mNot Installed\e[m"
fi
cd $HOME



## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r newsboat
fi
rm -rf    $PORG_HOME/src/newsboat

## Download
cd $PORG_HOME/src
git clone --verbose https://github.com/newsboat/newsboat.git
cd $PORG_HOME/src/newsboat

## Install
# ./configure \
#   --prefix=$PORG_HOME/usr 
make
make check
porg -lp newsboat "make install prefix=$PORG_HOME/usr"

## Check
if [ ! $? ]; then
	echo -e "\e[32;1mInstalled $(porg newsboat)\e[m"
else
	echo -e "\e[31;1mNot Installed\e[m"
fi
cd $HOME


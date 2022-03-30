#!/usr/bin/env bash

## php
## https://www.php-lang.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r php
fi
rm -rf    $HOME/.porg/$HOSTNAME/src/php

## Setup
mkdir -pv $HOME/.porg/$HOSTNAME/src/php
cd        $HOME/.porg/$HOSTNAME/src/php

## Download
export URL="http://jp2.php.net/get/php-7.2.3.tar.gz/from/this/mirror"
wget --no-check-certificate ${URL}
mv mirror php-7.2.3.tar.gz
tar -zxvf php-7.2.3.tar.gz
cd php-*/

## Install
./buildconf --force
./configure --prefix=$HOME/.porg/$HOSTNAME/usr
make
porg -lD "make install"

## Check
porg php
cd $HOME

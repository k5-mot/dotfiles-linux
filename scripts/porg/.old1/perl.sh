#!/usr/bin/env bash

## Perl
##

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r perl
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/perl

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/perl
cd        ${HOME}/.porg/$HOSTNAME/src/perl

## Download
export VERSION="5.34.0"
export URL="https://www.cpan.org/src/5.0/perl-${VERSION}.tar.gz"
wget --no-check-certificate ${URL}
tar -zxvf perl-${VERSION}.tar.gz
cd perl-${VERSION}/

## Install
sh Configure \
  -Dprefix=${HOME}/.porg/$HOSTNAME/usr \
  -des \
  -Duseshrplib
make
make test
porg -lD "make install"

## Check
porg perl
cd ${HOME}

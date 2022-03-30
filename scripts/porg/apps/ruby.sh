#!/usr/bin/env bash

## Ruby
## https://www.ruby-lang.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r ruby
fi
rm -rf    $HOME/.porg/$HOSTNAME/src/ruby

## Setup
mkdir -pv $HOME/.porg/$HOSTNAME/src/ruby
cd        $HOME/.porg/$HOSTNAME/src/ruby

## Download
export RUBY_VERSION="3.0.2"
wget http://cache.ruby-lang.org/pub/ruby/3.0/ruby-${RUBY_VERSION}.tar.gz
tar -zxvf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}/

## Install
./configure --prefix=$HOME/.porg/$HOSTNAME/usr
make
porg -lp  ruby-${RUBY_VERSION} "make install"

## Check
porg ruby

## Install
gem update
porg -lp+ ruby-${RUBY_VERSION} gem install neovim
gem list

cd $HOME

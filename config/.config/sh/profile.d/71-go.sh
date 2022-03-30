#!/usr/bin/env bash

## Go
export GOPATH=$XDG_CONFIG_HOME/go
if [ -e $GOPATH ]; then
  export PATH=$GOPATH/bin:$PATH
fi

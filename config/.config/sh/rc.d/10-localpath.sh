#!/usr/bin/env bash

##
## Environmental Variables
##
export LOCAL_ROOT=$HOME/.local

##
## PATH
##
[[ -d $LOCAL_ROOT/bin   ]] && export PATH=$LOCAL_ROOT/bin:$PATH
export PATH=$(echo $PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

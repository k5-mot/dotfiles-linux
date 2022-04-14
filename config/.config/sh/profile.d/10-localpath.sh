#!/usr/bin/env bash

export HOSTNAME=$(hostname -s)
export LOCAL_ROOT=${HOME}/.local

if [ -e ${LOCAL_ROOT} ]; then
  export PATH=${LOCAL_ROOT}/bin:${PATH}
fi


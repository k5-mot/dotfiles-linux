#!/usr/bin/env bash

##
## VcXsrv for WSL
##
if [ "$(uname 2> /dev/null)" = Linux ]; then
  if [[ "$(uname -r 2> /dev/null)" = *microsoft* ]]; then
    export LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
    export DISPLAY=$LOCAL_IP:0
    export LIBGL_ALWAYS_INDIRECT=1
#     export WIN_USERNAME=$(powershell.exe '$env:USERNAME' | sed -e 's/
# //g')
#     export WIN_USERHOME=/mnt/c/Users/$WIN_USERNAME
#     export WIN_USERDESK=$WIN_USERHOME/Desktop
  fi
fi

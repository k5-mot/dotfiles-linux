#!/usr/bin/env bash

##
## Porg
##
export HOSTNAME=$(hostname -s)
export PORG_ROOT=$HOME/.porg/$HOSTNAME
if [ -e $PORG_ROOT ]; then
  export PATH=$PORG_ROOT/opt/bin:$PORG_ROOT/usr/bin:$PATH
  export LD_LIBRARY_PATH=$PORG_ROOT/usr/lib64:$PORG_ROOT/usr/lib:$LD_LIBRARY_PATH
  export LIBRARY_PATH=$PORG_ROOT/usr/lib64:$PORG_ROOT/usr/lib:$LIBRARY_PATH
  export PKG_CONFIG_PATH=$PORG_ROOT/usr/lib64/pkgconfig:$PORG_ROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
  export MANPATH=$PORG_ROOT/usr/share/man:$MANPATH
  export INFOPATH=$PORG_ROOT/usr/share/info:$INFOPATH
  export CPATH=$PORG_ROOT/usr/include:$CPATH
  export C_INCLUDE_PATH=$PORG_ROOT/usr/include:$C_INCLUDE_PATH
  export CPLUS_INCLUDE_PATH=$PORG_ROOT/usr/include:$CPLUS_INCLUDE_PATH

  dirs=("$PORG_ROOT/include/c++" "$PORG_ROOT/usr/include/c++" "$PORG_ROOT/opt/include/c++")
  for dir1 in $dirs; do
    if [ -d $dir1 ]; then
      for dir2 in $(ls -1 $dir1 | sed 's/[@\/]//' | sort); do
        export CPLUS_INCLUDE_PATH=$dir1/$dir2:$CPLUS_INCLUDE_PATH
      done
    fi
  done

  if [ -d $HOME/.local/share/npm/bin ]; then
    export PATH=$HOME/.local/share/npm/bin:$PATH
  fi
fi

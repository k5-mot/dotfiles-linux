#!/usr/bin/env bash

##
## PATH
##
[[ -d /opt/bin         ]] && export PATH=/opt/bin:$PATH
[[ -d /snap/bin        ]] && export PATH=$PATH:/snap/bin
[[ -d /usr/local/sbin  ]] && export PATH=$PATH:/usr/local/sbin
[[ -d /usr/local/bin   ]] && export PATH=$PATH:/usr/local/bin
[[ -d /usr/sbin        ]] && export PATH=$PATH:/usr/sbin
[[ -d /usr/bin         ]] && export PATH=$PATH:/usr/bin
[[ -d /sbin            ]] && export PATH=$PATH:/sbin
[[ -d /bin             ]] && export PATH=$PATH:/bin
[[ -d /usr/games       ]] && export PATH=$PATH:/usr/games
[[ -d /usr/local/games ]] && export PATH=$PATH:/usr/local/games
export PATH=$(echo $PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## LD_LIBRARY_PATH
##
[[ -d /opt/lib64       ]] && export LD_LIBRARY_PATH=/opt/lib64:$LD_LIBRARY_PATH
[[ -d /opt/lib         ]] && export LD_LIBRARY_PATH=/opt/lib:$LD_LIBRARY_PATH
[[ -d /usr/local/lib   ]] && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
[[ -d /usr/local/lib64 ]] && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64
[[ -d /usr/lib         ]] && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
[[ -d /usr/lib64       ]] && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64
[[ -d /lib             ]] && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib
[[ -d /lib64           ]] && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib64
export LD_LIBRARY_PATH=$(echo $LD_LIBRARY_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## LIBRARY_PATH
##
[[ -d /opt/lib64       ]] && export LIBRARY_PATH=/opt/lib64:$LIBRARY_PATH
[[ -d /opt/lib         ]] && export LIBRARY_PATH=/opt/lib:$LIBRARY_PATH
[[ -d /usr/local/lib   ]] && export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
[[ -d /usr/local/lib64 ]] && export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib64
[[ -d /usr/lib         ]] && export LIBRARY_PATH=$LIBRARY_PATH:/usr/lib
[[ -d /usr/lib64       ]] && export LIBRARY_PATH=$LIBRARY_PATH:/usr/lib64
[[ -d /lib             ]] && export LIBRARY_PATH=$LIBRARY_PATH:/lib
[[ -d /lib64           ]] && export LIBRARY_PATH=$LIBRARY_PATH:/lib64
export LIBRARY_PATH=$(echo $LIBRARY_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## PKG_CONFIG_PATH
##
[[ -d /opt/lib64/pkgconfig       ]] && export PKG_CONFIG_PATH=/opt/lib64/pkgconfig:$PKG_CONFIG_PATH
[[ -d /opt/lib/pkgconfig         ]] && export PKG_CONFIG_PATH=/opt/lib/pkgconfig:$PKG_CONFIG_PATH
[[ -d /usr/local/lib/pkgconfig   ]] && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
[[ -d /usr/local/lib64/pkgconfig ]] && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib64/pkgconfig
[[ -d /usr/lib/pkgconfig         ]] && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig
[[ -d /usr/lib64/pkgconfig       ]] && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib64/pkgconfig
[[ -d /lib/pkgconfig             ]] && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/lib/pkgconfig
[[ -d /lib64/pkgconfig           ]] && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/lib64/pkgconfig
export PKG_CONFIG_PATH=$(echo $PKG_CONFIG_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## CPATH
##
[[ -d /opt/include       ]] && export CPATH=/opt/include:$CPATH
[[ -d /usr/local/include ]] && export CPATH=$CPATH:/usr/local/include
[[ -d /usr/include       ]] && export CPATH=$CPATH:/usr/include
[[ -d /include           ]] && export CPATH=$CPATH:/include
dirs=("/usr/lib/gcc/x86_64-redhat-linux" "/usr/lib/gcc/i686-redhat-linux")
for dir1 in $dirs; do
  if [ -d $dir1 ]; then
    for dir2 in $(ls -1 $dir1 | sed 's/[@\/]//' | sort); do
      if [ -d $dir1/$dir2/include ]; then
        export CPATH=$dir1/$dir2/include:$CPATH
      fi
    done
  fi
done
export CPATH=$(echo $CPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## C_INCLUDE_PATH
##
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$CPATH
export C_INCLUDE_PATH=$(echo $C_INCLUDE_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## CPLUS_INCLUDE_PATH
##
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$CPATH
dirs=("/usr/include/c++" "/usr/local/include/c++" "/opt/include/c++")
for dir1 in $dirs; do
  if [ -d $dir1 ]; then
    for dir2 in $(ls -1 $dir1 | sed 's/[@\/]//' | sort); do
      export CPLUS_INCLUDE_PATH=$dir1/$dir2:$CPLUS_INCLUDE_PATH
    done
  fi
done
export CPLUS_INCLUDE_PATH=$(echo $CPLUS_INCLUDE_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## CDPATH
##
export CDPATH=$CDPATH:.
export CDPATH=$(echo $CDPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## MANPATH
##
[[ -d /opt/share/man       ]] && export MANPATH=/opt/share/man:$MANPATH
[[ -d /usr/local/share/man ]] && export MANPATH=$MANPATH:/usr/local/share/man
[[ -d /usr/share/man       ]] && export MANPATH=$MANPATH:/usr/share/man
export MANPATH=$(echo $MANPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## INFOPATH
##
[[ -d /opt/share/info       ]] && export INFOPATH=/opt/share/info:$INFOPATH
[[ -d /usr/local/share/info ]] && export INFOPATH=$INFOPATH:/usr/local/share/info
[[ -d /usr/share/info       ]] && export INFOPATH=$INFOPATH:/usr/share/info
export INFOPATH=$(echo $INFOPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

##
## FPATH
##
export FPATH
export FPATH=$(echo $FPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

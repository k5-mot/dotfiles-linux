#!/usr/bin/env bash

export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME
export PATH=$PORG_HOME/bin:$PATH

./apps/porg.sh          # > /dev/null 2>&1
echo -e "\e[34mInstalled Porg Package Manager\e[m"

mkdir -pv $PORG_HOME/bin
for file in $(find $PORG_HOME/usr/bin -type f); do
    ln -sfv $file $PORG_HOME/bin/$(basename $file)
done
for filelink in $(find $PORG_HOME/usr/bin -type l); do
  srcname=$(readlink -f $filelink)
  dstname=$PORG_HOME/bin/$(basename $filelink)
  ln -sfv $srcname $dstname
done

./apps/libevent.sh      # > /dev/null 2>&1
echo -e "\e[34mInstalled libevent\e[m"

./apps/ncurses.sh       # > /dev/null 2>&1
echo -e "\e[34mInstalled ncurses\e[m"

./apps/utf8proc.sh      # > /dev/null 2>&1
echo -e "\e[34mInstalled utf8proc\e[m"

./apps/tmux.sh          # > /dev/null 2>&1
echo -e "\e[34mInstalled tmux\e[m"

./apps/google-chrome.sh # > /dev/null 2>&1
echo -e "\e[34mInstalled Google-Chrome\e[m"


for file in $(find $PORG_HOME/usr/bin -type f); do
    ln -sfv $file $PORG_HOME/bin/$(basename $file)
done
for filelink in $(find $PORG_HOME/usr/bin -type l); do
  srcname=$(readlink -f $filelink)
  dstname=$PORG_HOME/bin/$(basename $filelink)
  echo "$srcname -> $dstname"
  ln -sfv $srcname $dstname
done

#!/bin/bash
#Windows特有の c:/hoge/piyo → /mnt/c/hoge/piyo に書き換えてコマンドを実行するshellscript
newArgs=()
for arg in $@; do
  if [ ${arg:1:1} = : ]; then
    arg=/mnt/${arg:0:1}${arg#*:}
  fi
  newArgs+=( $arg )
done
${newArgs[@]}

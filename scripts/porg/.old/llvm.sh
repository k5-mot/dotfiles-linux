#!/usr/bin/env bash

## llvm

cd $HOME
cd $HOME/.local/src
if (type "porg" > /dev/null 2>&1); then
  porg -r llvm
fi

rm -rf $HOME/.local/src/llvm
mkdir -pv $HOME/.local/src/llvm
cd $HOME/.local/src/llvm
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-sles12.4.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-sles12.4.tar.xz.sha256
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-sles12.4.tar.xz.sig
PATH=/opt/gcc/bin/:/opt/cmake/bin/:$PATH
https://github.com/llvm/llvm-project/releases/tag/llvmorg-12.0.0
tar -xvf *.tar.xz

#rm -rf $HOME/.local/src/llvm-project
#git clone https://github.com/llvm/llvm-project.git
#cd $HOME/.local/src/llvm-project
#
#mkdir -pv build
#cd $HOME/.local/src/llvm-project/build/
#
#cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm
#make

cd $HOME


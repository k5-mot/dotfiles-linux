#!/usr/bin/env zsh

##
## Spack
## https://github.com/spack/spack
##

# spack install zlib
spack install gcc@8.5.0
spack load    gcc@8.5.0
SPACK_ROOT=$HOME/.local/spack
GCC_ROOT=$(find $SPACK_ROOT/opt/spack -type d -regextype posix-basic -regex ".*linux-.*/gcc-.*/gcc-.*" | head -1)

echo "- compiler:"                       >> $HOME/.spack/linux/compilers.yaml
echo "    spec: gcc@8.5.0"               >> $HOME/.spack/linux/compilers.yaml
echo "    paths:"                        >> $HOME/.spack/linux/compilers.yaml
echo "      cc:  $GCC_ROOT/bin/gcc"      >> $HOME/.spack/linux/compilers.yaml
echo "      cxx: $GCC_ROOT/bin/g++"      >> $HOME/.spack/linux/compilers.yaml
echo "      f77: $GCC_ROOT/bin/gfortran" >> $HOME/.spack/linux/compilers.yaml
echo "      fc:  $GCC_ROOT/bin/gfortran" >> $HOME/.spack/linux/compilers.yaml
echo "    flags: {}"                     >> $HOME/.spack/linux/compilers.yaml
echo "    operating_system: centos7"     >> $HOME/.spack/linux/compilers.yaml
echo "    target: x86_64"                >> $HOME/.spack/linux/compilers.yaml
echo "    modules: []"                   >> $HOME/.spack/linux/compilers.yaml
echo "    environment: {}"               >> $HOME/.spack/linux/compilers.yaml
echo "    extra_rpaths: []"              >> $HOME/.spack/linux/compilers.yaml

spack install zsh    %gcc@8.5.0
spack install fish   %gcc@8.5.0
spack install tmux   %gcc@8.5.0
spack install vim    %gcc@8.5.0
spack install neovim %gcc@8.5.0
spack install python %gcc@8.5.0
spacl install freeglut glew glfw glm %gcc@8.5.0


spack load    tmux
spack load    vim
spack load    neovim
spack load    python
python -m pip --upgrade pip


spack install nix    %gcc@8.5.0


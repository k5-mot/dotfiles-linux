#!/usr/bin/env zsh

##
## Spack
## https://github.com/spack/spack
##

spack install gcc@8.5.0
spack load    gcc@8.5.0
SPACK_ROOT=$HOME/.local/spack
GCC_ROOT=$(find $SPACK_ROOT/opt/spack -type d -regextype posix-basic -regex ".*linux-.*/gcc-.*/gcc-.*" | head -1)

sed -i -e "2i \
- compiler:                       \n\
    spec: gcc@8.5.0a              \n\
    paths:                        \n\
      cc:  $GCC_ROOT/bin/gcc      \n\
      cxx: $GCC_ROOT/bin/g++      \n\
      f77: $GCC_ROOT/bin/gfortran \n\
      fc:  $GCC_ROOT/bin/gfortran \n\
    flags: {}                     \n\
    operating_system: centos7     \n\
    target: x86_64                \n\
    modules: []                   \n\
    environment: {}               \n\
    extra_rpaths: []                 " $HOME/.spack/linux/compilers.yaml

# echo "- compiler:"                       >> $HOME/.spack/linux/compilers.yaml
# echo "    spec: gcc@8.5.0a"              >> $HOME/.spack/linux/compilers.yaml
# echo "    paths:"                        >> $HOME/.spack/linux/compilers.yaml
# echo "      cc:  $GCC_ROOT/bin/gcc"      >> $HOME/.spack/linux/compilers.yaml
# echo "      cxx: $GCC_ROOT/bin/g++"      >> $HOME/.spack/linux/compilers.yaml
# echo "      f77: $GCC_ROOT/bin/gfortran" >> $HOME/.spack/linux/compilers.yaml
# echo "      fc:  $GCC_ROOT/bin/gfortran" >> $HOME/.spack/linux/compilers.yaml
# echo "    flags: {}"                     >> $HOME/.spack/linux/compilers.yaml
# echo "    operating_system: centos7"     >> $HOME/.spack/linux/compilers.yaml
# echo "    target: x86_64"                >> $HOME/.spack/linux/compilers.yaml
# echo "    modules: []"                   >> $HOME/.spack/linux/compilers.yaml
# echo "    environment: {}"               >> $HOME/.spack/linux/compilers.yaml
# echo "    extra_rpaths: []"              >> $HOME/.spack/linux/compilers.yaml

spack install gcc@8.5.0 %gcc@8.5.0a
spack load    gcc@8.5.0
GCC_ROOT=$(find $SPACK_ROOT/opt/spack -type d -regextype posix-basic -regex ".*linux-.*/gcc-.*/gcc-.*" | head -1)

sed -i -e "2i\
- compiler:                       \n\
    spec: gcc@8.5.0               \n\
    paths:                        \n\
      cc:  $GCC_ROOT/bin/gcc      \n\
      cxx: $GCC_ROOT/bin/g++      \n\
      f77: $GCC_ROOT/bin/gfortran \n\
      fc:  $GCC_ROOT/bin/gfortran \n\
    flags: {}                     \n\
    operating_system: centos7     \n\
    target: x86_64                \n\
    modules: []                   \n\
    environment: {}               \n\
    extra_rpaths: []              \n" $HOME/.spack/linux/compilers.yaml

# echo "- compiler:"                       >> $HOME/.spack/linux/compilers.yaml
# echo "    spec: gcc@8.5.0"               >> $HOME/.spack/linux/compilers.yaml
# echo "    paths:"                        >> $HOME/.spack/linux/compilers.yaml
# echo "      cc:  $GCC_ROOT/bin/gcc"      >> $HOME/.spack/linux/compilers.yaml
# echo "      cxx: $GCC_ROOT/bin/g++"      >> $HOME/.spack/linux/compilers.yaml
# echo "      f77: $GCC_ROOT/bin/gfortran" >> $HOME/.spack/linux/compilers.yaml
# echo "      fc:  $GCC_ROOT/bin/gfortran" >> $HOME/.spack/linux/compilers.yaml
# echo "    flags: {}"                     >> $HOME/.spack/linux/compilers.yaml
# echo "    operating_system: centos7"     >> $HOME/.spack/linux/compilers.yaml
# echo "    target: x86_64"                >> $HOME/.spack/linux/compilers.yaml
# echo "    modules: []"                   >> $HOME/.spack/linux/compilers.yaml
# echo "    environment: {}"               >> $HOME/.spack/linux/compilers.yaml
# echo "    extra_rpaths: []"              >> $HOME/.spack/linux/compilers.yaml

spack install zsh      %gcc@8.5.0
spack install fish     %gcc@8.5.0
spack install tmux     %gcc@8.5.0
spack install vim      %gcc@8.5.0
spack install neovim   %gcc@8.5.0
spack install python   %gcc@8.5.0
spack install ruby     %gcc@8.5.0
spack install rust     %gcc@8.5.0
spack install node-js  %gcc@8.5.0
spack install freeglut %gcc@8.5.0
spack install glew     %gcc@8.5.0
spack install glfw     %gcc@8.5.0
spack install glm      %gcc@8.5.0

spack load    tmux
spack load    vim
spack load    neovim
spack load    python
spack load    rust
spack load    node-js
spack load    freeglut
spack load    glew
spack load    glfw
spack load    glm

spack find python
if [ $? ]; then
  python -m pip --upgrade pip
  python -m pip install pip-review
  python -m pip install flake8
  python -m pip install autopep8
  python -m pip install jupyter
  python -m pip install neovim
  python -m pip install matplotlib
  python -m pip install numpy
  python -m pip install scipy
fi
spack find rust
if [ $? ]; then
  cargo install exa
  cargo install bat
  cargo install hexyl
  cargo install procs
  cargo install ripgrep
fi
spack find node-js
if [ $? ]; then
  npm install --global npm
  npm install --global yarn
  npm install --global neovim
  npm install --global gtop
fi

# spack install nix    %gcc@8.5.0


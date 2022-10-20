#!/usr/bin/env bash

##
## APT (Advanced Packaging Tool)
## URL: https://salsa.debian.org/apt-team/apt.git
##

## Update
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

## Change package server to mirror servers
#sudo sed -i.bak -r 's!(deb|deb-src) \S+!\1 mirror://mirrors.ubuntu.com/mirrors.txt!' /etc/apt/

## Install
sudo apt install -y build-essential
sudo apt install -y libcurl4-openssl-dev libexpat1-dev # For Git
sudo apt install -y libx11-dev
sudo apt install -y libxmu-dev
sudo apt install -y libxi-dev
sudo apt install -y libffi-dev
sudo apt install -y libssl-dev
sudo apt install -y zlib1g-dev
sudo apt install -y liblzma-dev
sudo apt install -y libbz2-dev
sudo apt install -y libreadline-dev
sudo apt install -y libsqlite3-dev
sudo apt install -y git
sudo apt install -y cmake
sudo apt install -y automake
sudo apt install -y autoconf
sudo apt install -y pkg-config
sudo apt install -y bison
sudo apt install -y autotools-dev
sudo apt install -y libevent-dev
sudo apt install -y libncurses-dev
sudo apt install -y make
sudo apt install -y gcc
sudo apt install -y subversion
sudo apt install -y g++
sudo apt install -y ninja-build
sudo apt install -y gettext
sudo apt install -y libtool
sudo apt install -y libtool-bin
sudo apt install -y unzip
sudo apt install -y libgl1-mesa-dev
sudo apt install -y libglib2.0-0
sudo apt install -y libsm6
sudo apt install -y libxrender1
sudo apt install -y libxext6
sudo apt install -y libglu1-mesa-dev
sudo apt install -y mesa-common-dev
sudo apt install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
sudo apt install -y asciidoc xmlto docbook2x
#sudo apt install -y build-dep
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y xorg-dev
sudo apt install -y libtinfo-dev
sudo apt install -y libgnutls28-dev
sudo apt install -y gettext
sudo apt install -y libgtk2.0-dev
sudo apt install -y libssl-dev
sudo apt install -y libreadline-dev
sudo apt install -y zlib1g-dev
sudo apt install -y libbz2-dev
sudo apt install -y libsqlite3-dev
sudo apt install -y libncurses5-dev
sudo apt install -y libncursesw5-dev
sudo apt install -y libkrb5-dev
sudo apt install -y npm
sudo apt install -y vim
sudo apt install -y emacs
sudo apt install -y neovim
sudo apt install -y zsh
sudo apt install -y tmux
sudo apt install -y curl
sudo apt install -y wget
#sudo apt install -y llvm
#sudo apt install -y sqlite3
sudo apt install -y python
sudo apt install -y python-dev
sudo apt install -y python3
sudo apt install -y python3-dev
#sudo apt install -y python-tk
#sudo apt install -y python3-tk
#sudo apt install -y tk-dev
#sudo apt install -y aria2
#sudo apt install -y octave
#sudo apt install -y autoconf
#sudo apt install -y bison
#sudo apt install -y libssl-dev
#sudo apt install -y libyaml-dev
#sudo apt install -y libreadline6-dev
#sudo apt install -y zlib1g-dev
#sudo apt install -y libncurses5-dev
#sudo apt install -y libffi-dev
#sudo apt install -y libgdbm6
#sudo apt install -y libgdbm-dev
#sudo apt install -y libdb-dev
#sudo apt install -y clang-tools
#sudo apt install -y clangd
#sudo apt install -y ccls
#sudo npm install -g n
#sudo n stable
#sudo apt install -y ccache

# Pinta
#sudo apt install -y pinta
## GIMP
#sudo apt install -y gimp
## Inkscape
#sudo add-apt-repository -y ppa:inkscape.dev/stable
#sudo apt update
#sudo apt install -y inkscape
## SimpleScreenRecorder
#sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
#sudo apt update
#sudo apt install -y simplescreenrecorder
## Shotcut
#sudo add-apt-repository ppa:haraldhv/shotcut
#sudo apt update
#sudo apt install -y libsdl2-2.0-0
#sudo apt install -y shotcut
## Transmission
#sudo apt install -y transmission
## Gparted
#sudo apt install -y gparted gpart
## Google Chrome
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#sudo apt update
#sudo apt install -y google-chrome-stable

#!/usr/bin/env bash

##
## APT (Advanced Packaging Tool)
## URL: https://salsa.debian.org/apt-team/apt.git
##

## Update
sudo dnf makecache --refresh
sudo dnf updateinfo
sudo dnf upgrade -y
sudo dnf autoremove -y

## Install
sudo dnf install -y hostname
sudo dnf install -y zsh
sudo dnf install -y tmux
sudo dnf install -y curl
sudo dnf install -y wget
sudo dnf install -y git
sudo dnf install -y make
sudo dnf install -y cmake
sudo dnf install -y gcc
sudo dnf install -y gcc-c++
sudo dnf install -y binutils
sudo dnf install -y bison
sudo dnf install -y byacc
sudo dnf install -y m4
sudo dnf install -y patch
sudo dnf install -y automake
sudo dnf install -y autoconf
sudo dnf install -y unzip
sudo dnf install -y subversion
sudo dnf install -y python39
sudo dnf install -y fuse
sudo dnf install -y hwloc
sudo dnf install -y lm_sensors

sudo dnf install -y fuse-libs
sudo dnf install -y libcap
sudo dnf install -y ncurses ncurses-devel
sudo dnf install -y libnl3 libnl3-devel

sudo dnf install -y vim
sudo dnf install -y emacs

#!/usr/bin/env bash

## Update
sudo dnf makecache --refresh
sudo dnf updateinfo
sudo dnf upgrade -y
sudo dnf autoremove -y

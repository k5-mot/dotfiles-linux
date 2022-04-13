#!/usr/bin/env bash

## Update
sudo dnf updateinfo
sudo dnf upgrade -y
sudo dnf autoremove -y

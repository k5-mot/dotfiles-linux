#!/usr/bin/env bash

## GitHub CLI
##
## URL: https://cli.github.com/
##

export HOSTNAME=$(hostname -s)
export STOW_HOME=$HOME/.local/xstow/$HOSTNAME

## Remove
rm -rfv   $STOW_HOME/tmp/gh
rm -rfv   $STOW_HOME/{src,pkg}/github-cli
mkdir -pv $STOW_HOME/{src,pkg}/github-cli

# Download
export VERSION="2.2.0"
export URL="https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz"
https://github.com/cli/cli/releases/download/v2.14.7/gh_2.14.7_linux_amd64.tar.gz
wget --no-check-certificate ${URL}
tar -zxvf gh*.tar.gz
cd gh*/

# Install
porg -lp github_cli-${VERSION} "cp -rf * ${HOME}/.porg/${HOSTNAME}/usr"

# Check
porg github_cli
cd ${HOME}


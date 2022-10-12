#!/usr/bin/env bash

##
## GitHub CLI
##
## URL:     https://cli.github.com/
## Git URL: https://github.com/cli/cli
##

## Remove

export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r github_cli
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/github_cli

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/github_cli
cd        ${HOME}/.porg/$HOSTNAME/src/github_cli

# Download
export VERSION="2.2.0"
export URL="https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz"
wget --no-check-certificate ${URL}
tar -zxvf gh*.tar.gz
cd gh*/

# Install
porg -lp github_cli-${VERSION} "cp -rf * ${HOME}/.porg/${HOSTNAME}/usr"

# Check
porg github_cli
cd ${HOME}


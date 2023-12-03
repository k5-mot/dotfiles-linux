#!/usr/bin/env bash

###
### APT (Advanced Packaging Tool)
### URL: https://salsa.debian.org/apt-team/apt.git
###

### Update installed packages
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

### Install required packages
sudo apt install -y build-essential git cmake pkg-config curl wget
sudo apt install --install-suggests -y vim neovim zsh tmux

# For Python (https://github.com/pyenv/pyenv/wiki#suggested-build-environment)
sudo apt install -y build-essential \
	libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
	libsqlite3-dev curl libncursesw5-dev xz-utils \
	tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# For Ruby (https://github.com/rbenv/ruby-build/wiki#suggested-build-environment)
sudo apt install -y autoconf patch build-essential \
	rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
	libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev \
	libdb-dev uuid-dev

# For NodeJS (https://github.com/nodejs/node/blob/main/BUILDING.md#unix-prerequisites)
sudo apt install -y python3 g++ make python3-pip

# For Lua (https://github.com/Stratus3D/asdf-lua)
# sudo apt install --install-suggests -y linux-headers-$(uname -r) build-essential

# For Vim (https://github.com/vim/vim/blob/master/src/INSTALL)
sudo apt install -y git make clang libtool-bin \
	libxt-dev libgtk-3-dev libpython3-dev valgrind

# For Neovim (https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites)
sudo apt install -y ninja-build gettext cmake unzip curl

# For tmux (https://github.com/tmux/tmux/wiki/Installing)
sudo apt install -y \
	libevent-dev ncurses-dev build-essential bison pkg-config \
	libutf8proc-dev libutempter0
# libevent ncurses


### Install Docker (https://docs.docker.com/engine/install/ubuntu/)

# Uninstall old versions
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt remove $pkg;
done

# Add Docker's official GPG key
sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg --batch --yes
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Install latest versions
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify that the Docker Engine installation is successful
sudo docker run hello-world
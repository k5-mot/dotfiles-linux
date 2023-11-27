#!/usr/bin/env bash

set -x

### HOME directory on Windows Filesystem
export WINHOME=$(wslpath $(cmd.exe /C "echo %USERPROFILE%" 2>/dev/null | tr -d '\r'))
export XDG_DATA_HOME=$HOME/.local/share
export ASDF_LATEST_VERSION=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest | grep "tag_name" | sed 's/^.*\"tag_name\": "\(.*\)".*$/\1/')
export ASDF_VIM_TYPE="huge"

### Enable to be used all commands without sudo
if ! sudo grep -q "$USER ALL=NOPASSWD: ALL" /etc/sudoers; then
	sudo echo "$USER ALL=NOPASSWD: ALL" | sudo tee --append "/etc/sudoers"
fi

### Synchronize SSH key from Windows to WSL
if [ ! -e ~/.ssh/id_rsa ]; then
	cp $WINHOME/.ssh/id_rsa{,.pub} ~/.ssh
	chmod 600 ~/.ssh/id_rsa{,.pub}
fi

### Update installed packages
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

### Install required packages
sudo apt install -y build-essential git cmake vim neovim zsh tmux curl wget 
# sudo apt install --install-suggests -y build-essential git cmake vim neovim zsh tmux curl wget 

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


### Install asdf
rm -rfv $XDG_DATA_HOME/asdf
git clone --verbose https://github.com/asdf-vm/asdf.git $XDG_DATA_HOME/asdf --branch $ASDF_LATEST_VERSION
. "$XDG_DATA_HOME/asdf/asdf.sh"
asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf plugin add ruby   https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 
asdf plugin add lua    https://github.com/Stratus3D/asdf-lua.git  
asdf plugin add vim    https://github.com/tsuyoshicho/asdf-vim.git
asdf plugin add neovim https://github.com/richin13/asdf-neovim.git
asdf plugin add tmux   https://github.com/aphecetche/asdf-tmux.git

asdf install python latest
asdf install ruby   latest
asdf install nodejs latest
asdf install lua    latest
asdf install vim    latest
asdf install neovim stable
asdf install tmux   latest

asdf global  python latest
asdf global  ruby   latest
asdf global  nodejs latest
asdf global  lua    latest
asdf global  vim    latest
asdf global  neovim stable
asdf global  tmux   latest

asdf reshim python



#!/usr/bin/env bash

##
## asdf
##
## URL: https://asdf-vm.com/
## Git: https://github.com/asdf-vm/asdf
##

function install-via-pip3() {
	pip3 install --upgrade pip
	pip3 install flake8
	pip3 install autopep8
	pip3 install jupyter
	pip3 install neovim
	pip3 install matplotlib
	pip3 install numpy
	pip3 install scipy
	pip3 install pandas
	pip3 install torch
	pip3 install torchvision
	pip3 install tensorflow
}

function install-via-gem() {
	gem install neovim
}

function install-via-npm() {
	npm install --global npm
	npm install --global yarn
	npm install --global neovim
	npm install --global gtop
}

function install-via-cargo() {
	cargo install exa
	cargo install bat
	cargo install hexyl
	cargo install procs
	cargo install ripgrep
}

export INSTALL_LOG=$XDG_DATA_HOME/asdf/install.log

echo "Setup"
rm -rfv   $XDG_DATA_HOME/asdf > /dev/null
mkdir -pv $XDG_DATA_HOME/asdf > /dev/null
touch $INSTALL_LOG

echo "Download"

git clone --verbose https://github.com/asdf-vm/asdf.git $XDG_DATA_HOME/asdf --branch v0.10.2 > $INSTALL_LOG
. $XDG_DATA_HOME/asdf/asdf.sh > /dev/null

echo "Install plugins"

asdf plugin add python https://github.com/danhper/asdf-python.git  > $INSTALL_LOG
asdf plugin add ruby   https://github.com/asdf-vm/asdf-ruby.git    > $INSTALL_LOG
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git  > $INSTALL_LOG
asdf plugin add rust   https://github.com/code-lever/asdf-rust.git > $INSTALL_LOG
asdf plugin add go     https://github.com/kennyp/asdf-golang.git   > $INSTALL_LOG

echo "Install env"

asdf install python 3.9.13  > $INSTALL_LOG &
asdf install ruby   3.1.2   > $INSTALL_LOG &
asdf install nodejs 16.17.0 > $INSTALL_LOG &
asdf install rust   1.63.0  > $INSTALL_LOG &
asdf install go     1.18.5  > $INSTALL_LOG &

wait $!
echo "  Installed: $?"

echo "Setup env"

asdf global  python 3.9.13  > $INSTALL_LOG
asdf global  ruby   3.1.2   > $INSTALL_LOG
asdf global  nodejs 16.17.0 > $INSTALL_LOG
asdf global  rust   1.63.0  > $INSTALL_LOG
asdf global  go     1.18.5  > $INSTALL_LOG

echo "Install packages"

install-via-pip3  > $INSTALL_LOG &
install-via-gem   > $INSTALL_LOG &
install-via-npm   > $INSTALL_LOG &
install-via-cargo > $INSTALL_LOG &

wait $!
echo "  Installed: $?"


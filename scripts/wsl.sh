#!/usr/bin/env bash

set -x

# ### HOME directory on Windows Filesystem
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

###
./apt/install.sh





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
asdf plugin add jq     https://github.com/lsanwick/asdf-jq.git
asdf plugin add peco   https://github.com/asdf-community/asdf-peco.git
asdf plugin add fzf    https://github.com/kompiro/asdf-fzf.git

asdf install python latest
asdf install ruby   latest
asdf install nodejs latest
asdf install lua    latest
asdf install vim    latest
asdf install neovim stable
asdf install tmux   latest
asdf install jq     latest
asdf install peco   latest
asdf install fzf    latest

asdf global  python latest
asdf global  ruby   latest
asdf global  nodejs latest
asdf global  lua    latest
asdf global  vim    latest
asdf global  neovim stable
asdf global  tmux   latest
asdf global  jq     latest
asdf global  peco   latest
asdf global  fzf    latest

asdf reshim python

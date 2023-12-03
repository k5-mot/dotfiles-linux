#!/usr/bin/env zsh

##
## Tmux Plugin Manager
##
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export TMUX_HOME=${XDG_DATA_HOME}/tmux
export TPM_HOME=${TMUX_HOME}/plugins/tpm
export TMUX_PLUGIN_MANAGER_PATH=${XDG_DATA_HOME}/tmux/plugins
if [ ! -d $TPM_HOME ]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_HOME
fi

#!/usr/bin/env zsh

##
## Tmux Plugin Manager
##
if [ ! -d $HOME/.cache/tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.cache/tmux/plugins/tpm
fi

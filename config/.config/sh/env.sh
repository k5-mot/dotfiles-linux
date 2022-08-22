#!/usr/bin/env bash

### XDG {{{
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.cache/xdg"
export DG_DATA_HOME="$HOME/.local/share"
### }}}

## ### Locale {{{
## Basic locale
export LANG="en_US.UTF-8"
## Translation priorities
export LANGUAGE="en_US"
## All locale
export LC_ALL="en_US.UTF-8"
### }}}

### Environment variable {{{

## Term
export TERM="xterm-256color"
# export TERM="screen-256color"

## Default editor
if command -v neovim &>/dev/null; then
  export EDITOR="neovim"
elif command -v nvim &>/dev/null; then
  export EDITOR="nvim"
elif command -v vim  &>/dev/null; then
  export EDITOR="vim"
elif command -v vi   &>/dev/null; then
  export EDITOR="vi"
fi

if command -v neovim &>/dev/null; then
  alias nvim="neovim"
  alias vim="neovim"
  alias vi="neovim"
elif command -v nvim &>/dev/null; then
  alias vim="nvim"
  alias vi="nvim"
elif command -v vim  &>/dev/null; then
  alias vi="vim"
elif command -v vi   &>/dev/null; then
  alias vi="vi"
fi

## Default pager
if command -v vimpager 1>/dev/null 2>&1; then
  export PAGER="vimpager"
  export MANPAGER="vimpager"
else
  export PAGER="less -iMR"
  export MANPAGER="less -iMR"
fi

## Stop alert of mail check by zsh.
export MAILCHECK=0
## Stack of history by changing directory.
export DIRSTACKSIZE=20
## Japanese conversion dictionary
export JSERVER="localhost"

## less
export LESSCHARSET=utf-8
export LESS="-iMR"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
## GNUPLOT
export GNUPLOT_HISTORY_FILE="$XDG_CACHE_HOME/gnuplot/history"

## Colorize man command.
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;33m") \
        LESS_TERMCAP_md=$(printf "\e[1;36m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
export LESS_TERMCAP_mb=$(printf "\e[1;33m")
export LESS_TERMCAP_md=$(printf "\e[1;36m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

## Neovim logger
export NVIM_PYTHON_LOG_FILE="$HOME/.cache/nvim/python.log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG

##
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export RUSTUP_HOME="$XDG_CACHE_HOME/rustup"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export BAT_THEME="OneHalfDark"
export LOCAL_ROOT="$HOME/.local"


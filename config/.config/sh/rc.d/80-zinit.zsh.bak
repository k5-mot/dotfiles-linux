#!/usr/bin/env zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

export ZSH_VERSION=$(zsh --version | awk '{print $2}')
zsh_ok=$(test "$(printf '%s\n' "4.3.9" "$ZSH_VERSION" | sort -V | head -n1)" = "5.5.0"; echo $?)

if [ $zsh_ok ]; then

    ### Added by Zinit's installer
    if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
        print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
        command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
        command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
            print -P "%F{33} %F{34}Installation successful.%f%b" || \
            print -P "%F{160} The clone has failed.%f%b"
    fi

    source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    # autoload -U promptinit
    # promptinit

    # Load a few important annexes, without Turbo
    # (this is currently required for annexes)
    zinit light-mode for \
        zdharma-continuum/zinit-annex-as-monitor \
        zdharma-continuum/zinit-annex-bin-gem-node \
        zdharma-continuum/zinit-annex-patch-dl \
        zdharma-continuum/zinit-annex-rust

    ### End of Zinit's installer chunk

    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-completions
    zinit light zsh-users/zsh-history-substring-search
    zinit light zdharma/history-search-multi-word

fi


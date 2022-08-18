#!/usr/bin/env zsh

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
export ZPLUG_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zplug"

if command -v zsh &>/dev/null; then
  export ZSH_VERSION="$(zsh --version | awk '{print $2}' | (IFS=. read -r major minor micro; printf "%2d%02d%02d" ${major:-0} ${minor:-0} ${micro:-0}))"
fi
if command -v git &>/dev/null; then
  export GIT_VERSION="$(git --version | awk '{print $3}' | (IFS=. read -r major minor micro; printf "%2d%02d%02d" ${major:-0} ${minor:-0} ${micro:-0}))"
  # echo """
fi

if [ "$ZSH_VERSION" -ge 50400 ]; then

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
    ### End of Zinit's installer chunk

    # # Load a few important annexes, without Turbo
    # # (this is currently required for annexes)
    # zinit light-mode for \
    #     zinit-zsh/z-a-rust \
    #     zinit-zsh/z-a-as-monitor \
    #     zinit-zsh/z-a-patch-dl \
    #     zinit-zsh/z-a-bin-gem-node

    # zinit ice wait lucid
    zinit light zsh-users/zsh-completions
    # zinit ice wait lucid
    zinit light zsh-users/zsh-autosuggestions
    # zinit ice wait lucid
    # zinit light zsh-users/zsh-syntax-highlighting
    # zinit ice wait lucid
    zinit light chrissicool/zsh-256color
    zinit light zdharma-continuum/fast-syntax-highlighting
    zinit light zdharma-continuum/history-search-multi-word

    # zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
    # zinit light sindresorhus/pure

    zinit ice as"command" from"gh-r" atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh"
    zinit light starship/starship

    zinit ice from"gh-r" as"program"
    zinit light junegunn/fzf

    zinit ice from"gh-r" as"program" mv"docker* -> docker-compose"
    zinit load docker/compose

    zinit ice from"gh-r" as"program"
    zinit load stedolan/jq

    zinit ice from"gh-r" as"program" pick"peco_*/peco"
    zinit light peco/peco

    zinit light supercrabtree/k

    zinit ice \
        as"program" \
        atclone"rm -f src/auto/config.cache; ./configure" \
        atpull"%atclone" \
        make \
        pick"src/vim"
    zinit light vim/vim

    zinit ice from"gh-r" as"program" mv"appimage-cli-tool-* -> appimage-cli-tool" pick"appimage-cli-tool-*.AppImage"
    zinit light AppImageCrafters/appimage-cli-tool

    zinit ice from"gh-r" as"program" mv"appimagelauncher-lite-* -> appimagelauncher" pick"appimage-launcher-*.AppImage"
    zinit light TheAssassin/AppImageLauncher

elif [ "$ZSH_VERSION" -ge 40309 -a "$GIT_VERSION" -ge 10700 ]; then

  ## Install
  # export ZPLUG_HOME=$ZDOTCACHE/zplug
  if [[ ! -e $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
  fi
  ## Initialize
  source "$ZPLUG_HOME/init.zsh"

  ## Plugin list
  zplug "zplug/zplug", hook-build: "zplug --self-manage"
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-history-substring-search"
  # zplug "zdharma-continuum/fast-syntax-highlighting"
  # zplug "zdharma-continuum/history-search-multi-word"
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "mollifier/anyframe"
  zplug "mollifier/cd-gitroot"
  zplug "starship/starship", from:gh-r, as:command
  zplug "stedolan/jq", from:gh-r, as:command # , rename-to:jq
  zplug "peco/peco", as:command, from:gh-r, rename-to:peco
  zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
#   zplug "b4b4r07/enhancd"
  zplug "mrowa44/emojify", as:command
  zplug "bilelmoussaoui/flatpak-zsh-completion", defer:2
  zplug "junegunn/fzf", from:gh-r, as:command, rename-to:fzf #, use:"*darwin*amd64*"
  zplug "chrissicool/zsh-256color"
  zplug "supercrabtree/k"
  zplug "docker/compose", from:gh-r, as:command, rename-to:"docker-compose"

  # zplug "AppImageCrafters/appimage-cli-tool", from:gh-r, as:command, rename-to:"appimage-cli-tool" # , use:"appimage-cli-tool-*.AppImage"

  # zplug "TheAssassin/AppImageLauncher" #, from:gh-r, as:command, rename-to:"appimagelauncher" #, use:"appimagelauncher-lite-*-x86_64*.AppImage"

  # Install plugins
  if ! zplug check --verbose; then
    zplug install
    # printf "Install? [y/N]: "
    # if read -q; then
    #   echo; zplug install
    # fi
  fi
  zplug load

  # zsh-completions
  # export FPATH=$FPATH:$ZPLUG_HOME/repos/zsh-users/zsh-completions/src
  bindkey '^xe' emoji::cli
  bindkey '^x^e' emoji::cli

elif [ $ZSH_VERSION -ge 40311 ]; then
  export ADOTDIR="$HOME/.cache/zsh/antigen"
  export ANTIGEN_LOG="$ADOTDIR/antigen.log"

  source $HOME/.config/zsh/antigen.zsh

  # Load the oh-my-zsh's library.
  antigen use oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  antigen bundle git
  # antigen bundle heroku
  antigen bundle pip
  # antigen bundle lein
  antigen bundle command-not-found

  # Syntax highlighting bundle.
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-history-substring-search
  antigen bundle zsh-users/zsh-completions
  # antigen bundle zsh-users/zsh-autosuggestions

  # Load the theme.
  antigen theme robbyrussell

  # Tell Antigen that you're done.
  antigen apply

fi


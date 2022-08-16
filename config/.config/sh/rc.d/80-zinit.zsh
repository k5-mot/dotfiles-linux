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
    # zinit ice \
    #     as"program" \
    #     atclone"rm -f src/auto/config.cache; ./configure --with-pydebug" \
    #     atpull"%atclone" \
    #     make
    # zinit light python/cpython

    # https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.xz


    # zinit ice depth=1
    # zinit light romkatv/powerlevel10k
    # Load a few important annexes, without Turbo
    # (this is currently required for annexes)
    # zinit light-mode for \
    #     zdharma-continuum/zinit-annex-as-monitor \
    #     zdharma-continuum/zinit-annex-bin-gem-node \
    #     zdharma-continuum/zinit-annex-patch-dl \
    #     zdharma-continuum/zinit-annex-rust

    # zinit light zsh-users/zsh-syntax-highlighting
    # zinit light zsh-users/zsh-autosuggestions
    # zinit light zsh-users/zsh-completions
    # zinit light zsh-users/zsh-history-substring-search
    # zinit light zdharma/history-search-multi-word
    # Plugin history-search-multi-word loaded with investigating.
    # zinit load zdharma-continuum/history-search-multi-word
    # Two regular plugins loaded without investigating.
    # zinit light zsh-users/zsh-autosuggestions
    # zinit light zdharma-continuum/fast-syntax-highlighting
    # zinit load zsh-users/zsh-syntax-highlighting
    # zinit load zsh-users/zsh-history-substring-search
    # zinit load zsh-users/zsh-completions
    # zinit load zsh-users/zsh-autosuggestions
    # zinit load mollifier/anyframe
    # zinit load mollifier/cd-gitroot
    # zinit load stedolan/jq
    # zinit load peco/peco
    # zinit load b4b4r07/emoji-cli
    # zinit load mrowa44/emojify
    # zinit load bilelmoussaoui/flatpak-zsh-completion
    # zinit load chrissicool/zsh-256color
    # zinit self-update

fi


#!/usr/bin/env zsh

export ZSH_VERSION=$(zsh --version | awk '{print $2}')
export GIT_VERSION=$(git --version | awk '{print $3}')
zsh_ok=$(test "$(printf '%s\n' "4.3.9" "$ZSH_VERSION" | sort -V | head -n1)" = "4.3.9"; echo $?)
git_ok=$(test "$(printf '%s\n' "1.7.0" "$GIT_VERSION" | sort -V | head -n1)" = "1.7.0"; echo $?)

if [ $zsh_ok -a $git_ok ]; then

  ## Install
  export ZPLUG_HOME=$ZDOTCACHE/zplug
  if [[ ! -e $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
  fi
  ## Initialize
  source $ZPLUG_HOME/init.zsh

  ## Plugin list
  zplug "zplug/zplug", hook-build: "zplug --self-manage"
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "mollifier/anyframe"
  zplug "mollifier/cd-gitroot"
  zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
  zplug "peco/peco", as:command, from:gh-r, rename-to:peco
  zplug "b4b4r07/emoji-cli", \
   on:"stedolan/jq"
  zplug "b4b4r07/enhancd"
  zplug "mrowa44/emojify", as:command
  zplug "bilelmoussaoui/flatpak-zsh-completion", defer:2
  # zplug "junegunn/fzf-bin", \
  #   from:gh-r, \
  #   as:command, \
  #   rename-to:fzf, \
  #   use:"*darwin*amd64*"
  zplug "chrissicool/zsh-256color"

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
  export FPATH=$FPATH:$ZPLUG_HOME/repos/zsh-users/zsh-completions/src
fi
bindkey '^xe' emoji::cli
bindkey '^x^e' emoji::cli
# export EMOJI_CLI_KEYBIND="^x^e"

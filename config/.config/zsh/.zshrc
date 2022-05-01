#!/usr/bin/env zsh

# zmodload zsh/zprof

## Create zsh cache directory.
if [ ! -e $ZDOTCACHE ]; then
  mkdir -p $ZDOTCACHE
fi

### Alias {{{
# Set up aliases
alias mv='nocorrect mv -i'       # no spelling correction on mv
#alias cp='nocorrect cp -i'       # no spelling correction on cp
alias rm='nocorrect rm -i'       # no spelling correction on rm
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias x=exit
alias grep='grep --color=auto'
#alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget/history.log"
alias osinfo='cat /etc/*-release'
alias xsel="xsel --logfile=$XDG_CACHE_HOME/xsel/history.log"

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# List only file beginning with "."
alias lsa='ls -ld .*'

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g M='|more'
alias -g H='|head'
alias -g T='|tail'
### }}}

### Function {{{
function freload() {
  while (( $# )); do;
    unfunction $1;
    autoload -U $1;
    shift;
  done
}
### }}}

## History {{{
## 履歴ファイルの保存先
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
## メモリに保存される履歴件数
export HISTSIZE=100
## 履歴ファイルに保存される履歴件数
export SAVEHIST=100000
## Delete old duplication of history.
setopt hist_ignore_all_dups
## Delete duplication of previous command.
setopt hist_ignore_dups
## Share history file.
setopt share_history
## Append history file, not resave.
setopt append_history
## Append history file each entering command.
setopt inc_append_history
## Save current time in history file.
setopt extended_history
## Not save command in history.
setopt hist_no_store
## Save without blank.
setopt hist_reduce_blanks
## Active cdr command. (cd recent file command)
autoload -Uz chpwd_recent_dirs
autoload -Uz cdr
autoload -Uz add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-max 1000
zstyle ':chpwd:*' recent-dirs-file $ZDOTCACHE/chpwd-recent-dirs
## Search function
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
## }}}

## Color {{{
## Set SHELL
if [[ -z "$SHELL" ]]; then
  export SHELL="$(command -v zsh)"
fi
## Use colors
autoload -Uz colors
colors
## Remove file mark.
unsetopt list_types
## Color list
#local DEFAULT=$'%{^[[m%}'$
#local RED=$'%{^[[1;31m%}'$
#local GREEN=$'%{^[[1;32m%}'$
#local YELLOW=$'%{^[[1;33m%}'$
#local BLUE=$'%{^[[1;34m%}'$
#local PURPLE=$'%{^[[1;35m%}'$
#local LIGHT_BLUE=$'%{^[[1;36m%}'$
#local WHITE=$'%{^[[1;37m%}'$
## }}}

## Completion {{{
## Highlight completion.
autoload -U compinit
compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump.log
zstyle ':completion:*:default' menu select=1
# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'"$DEFAULT"
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'"$DEFAULT"
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'"$DEFAULT"
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'"$DEFAULT"
# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''
# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
## LS_COLORS
#if [[ -f $ZDOTDIR/.dircolors && -x `which dircolors` ]]; then
#  eval `dircolors -b $ZDOTDIR/.dircolors`
#  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#fi
if [[ -f $XDG_CONFIG_HOME/dircolors && -x `which dircolors` ]]; then
  eval `dircolors -b $XDG_CONFIG_HOME/dircolors`
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
## Define demiter of words.
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-. /=;@:{},|"
zstyle ':zle:*' word-style unspecified
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
  'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# formatting and messages
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
#zstyle ':completion:*' group-name ''
# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
hosts=(`hostname` ftp.math.gatech.edu prep.ai.mit.edu wuarchive.wustl.edu)
export hosts
zstyle '*' hosts $hosts
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
  '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)
# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
## }}}
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

### search a destination from cdr list and cd the destination
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^x' peco-cdr
alias gh='cd $(ghq list -p | peco)'
alias gho='gh-open $(ghq list -p | peco)'
## Keybinding {{{
## Set up Vim key bindings.
bindkey -v
## Set up Emacs key bindings.
#bindkey -e
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^W' backward-kill-word
# Some nice key bindings
#bindkey '^X^Z' universal-argument ' ' magic-space
#bindkey '^X^A' vi-find-prev-char-skip
#bindkey '^Xa' _expand_alias
#bindkey '^Z' accept-and-hold
#bindkey -s '\M-/' \\\\
#bindkey -s '\M-=' \|

# suggestion
bindkey '^ ' autosuggest-accept
## }}}
autoload -Uz add-zsh-hook

## git設定
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}+"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}±"
zstyle ':vcs_info:*' formats "%F{green}$(echo "\uf7a1 ")%c%u %b%f"
zstyle ':vcs_info:*' actionformats "%F{cyan}$(echo "\uf7a1 ") %b|%a%f"



export PROMPT="%F{green}%n%f%F{magenta}@%f%F{blue}%m%f%F{magenta}:%f%F{cyan}%~%f
%F{green}$%f "


## Others {{{
# ディレクトリ選択時、最後の/を残す
setopt no_auto_remove_slash
# Set/unset  shell options
setopt notify globdots correct pushdtohome cdablevars autolist
setopt correctall autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent noclobber
setopt autopushd pushdminus extendedglob rcquotes mailwarning
setopt ignoreeof
setopt no_beep
setopt nolistbeep
unsetopt bgnice autoparamslash
# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
# set up tetris
autoload -Uz tetris
zle -N tetris
#bindkey '...' tetris
# set up tetris 1
autoload -Uz tetriscurses
#alias tetris=tetriscurses
## }}}

## Local Setting
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

### Appendix {{{
for i in $XDG_CONFIG_HOME/sh/rc.d/*.sh $XDG_CONFIG_HOME/sh/rc.d/*.zsh ; do
  if [ -r "$i" ]; then
    if [ "${-#*i}" != "$-" ]; then
      source "$i"
    else
      source "$i" >/dev/null
    fi
  fi
done

## Local Setting
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

### }}}

## Compile
if [ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
  zcompile $ZDOTDIR/.zshrc
fi

# if (which zprof > /dev/null); then
#   zprof | less
# fi


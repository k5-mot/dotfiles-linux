#!/usr/bin/env bash

### BLE {{{

export BLE_SH=$HOME/.local/share/blesh/ble.sh
if [ ! -f $BLE_SH ]; then
    mkdir -pv $HOME/.local/tmp
    cd        $HOME/.local/tmp
    git clone --recursive https://github.com/akinomyoga/ble.sh.git
    make -C ble.sh install PREFIX=$HOME/.local
fi

### }}}

# Add this lines at the top of .bashrc:
[[ $- == *i* ]] && source $HOME/.local/share/blesh/ble.sh --noattach

# your bashrc settings come here...


alias where="type -a"

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Prompt
if [ "$color_prompt" = yes ]; then
    export PS1="\[\033[00;32m\]\u\[\033[00;35m\]@\[\033[00;34m\]\h\[\033[00;35m\]:\[\033[00;36m\]\w\n\[\033[01;32m\]\$\[\033[00m\] "
    export PS2="\[\033[00;34m\]>\[\033[00m\] "
else
    export PS1="\u@\h:\w\n\$ "
fi

## Completion
unset color_prompt force_color_prompt
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'


### ASDF {{{
export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
export ASDF_DIR=$XDG_DATA_HOME/asdf
export ASDF_DATA_DIR=$ASDF_DIR
# export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=tool-version
if [ -d $ASDF_DIR ]; then
    . $XDG_DATA_HOME/asdf/asdf.sh
    export FPATH="$ASDF_DIR/completions:$FPATH"
    if [ -d $ASDF_DIR/installs/rust ]; then
        export PATH=$ASDF_DIR/installs/rust/stable/bin:$PATH
        source $ASDF_DIR/installs/rust/stable/env
    fi
    if [ -d $ASDF_DIR/installs/nodejs ]; then
        if [ -d $XDG_DATA_HOME/npm ]; then
            export PATH=$XDG_DATA_HOME/npm/bin:$PATH
        fi
    fi
    if [ -d $ASDF_DIR/installs/rust ]; then
        if [ -d $XDG_DATA_HOME/cargo ]; then
            export PATH=$XDG_DATA_HOME/cargo/bin:$PATH
        fi
    fi
fi
### }}}

### Flatpak, LOCAL {{{
if command -v flatpak &> /dev/null; then
    if [ -e $FLATPAK_ROOT ]; then
        export PATH=$FLATPAK_ROOT/bin:$PATH
    fi
fi
if [ -e $LOCAL_ROOT ]; then
    export PATH=$LOCAL_ROOT/bin:$PATH
fi
### }}}



### Appendix {{{
for i in $XDG_CONFIG_HOME/sh/rc.d/*.sh $XDG_CONFIG_HOME/sh/rc.d/*.bash ; do
    if [ -r "$i" ]; then
        if [ "${-#*i}" != "$-" ]; then
            . "$i"
        else
            . "$i" >/dev/null
        fi
    fi
done
### }}}

## Local Setting
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Remove duplicated path.
export PATH="$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export CDPATH="$(printf %s "$CDPATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export FPATH="$(printf %s "$FPATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export MANPATH="$(printf %s "$MANPATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export INFOPATH="$(printf %s "$INFOPATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export LD_LIBRARY_PATH="$(printf %s "$LD_LIBRARY_PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export LIBRARY_PATH="$(printf %s "$LIBRARY_PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export CPATH="$(printf %s "$CPATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export C_INCLUDE_PATH="$(printf %s "$C_INCLUDE_PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export CPLUS_INCLUDE_PATH="$(printf %s "$CPLUS_INCLUDE_PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"
export PKG_CONFIG_PATH="$(printf %s "$PKG_CONFIG_PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')"

# Remove blank path.
export PATH=$(echo $PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export CDPATH=$(echo $CDPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export FPATH=$(echo $FPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export MANPATH=$(echo $MANPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export INFOPATH=$(echo $INFOPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export LD_LIBRARY_PATH=$(echo $LD_LIBRARY_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export LIBRARY_PATH=$(echo $LIBRARY_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export CPATH=$(echo $CPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export C_INCLUDE_PATH=$(echo $C_INCLUDE_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export CPLUS_INCLUDE_PATH=$(echo $CPLUS_INCLUDE_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export PKG_CONFIG_PATH=$(echo $PKG_CONFIG_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')

# Add this line at the end of .bashrc:
[[ ${BLE_VERSION-} ]] && ble-attach
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

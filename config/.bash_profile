#!/usr/bin/env bash

## Basis {{{
if [ -e $HOME/.config/sh/env.sh ]; then
  . $HOME/.config/sh/env.sh
fi
# if [ -e $HOME/.config/sh/path.sh ]; then
#   . $HOME/.config/sh/path.sh
# fi
## }}}

### Appendix {{{
for i in $XDG_CONFIG_HOME/sh/profile.d/*.sh $XDG_CONFIG_HOME/sh/profile.d/*.bash ; do
  if [ -r "$i" ]; then
    if [ "${-#*i}" != "$-" ]; then
      . "$i"
    else
      . "$i" >/dev/null
    fi
  fi
done
### }}}

### Local Setting {{{
if [ -f ~/.bash_profile_local ]; then
  . ~/.bash_profile_local
fi
### }}}

## Remove duplicated path.
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

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

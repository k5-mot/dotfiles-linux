#!/usr/bin/env zsh

# prof
# zmodload zsh/zprof && zprof

## Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit -s
umask 022

### Basis {{{
if [ -e $HOME/.config/sh/env.sh ]; then
  source $HOME/.config/sh/env.sh
fi
# if [ -e $HOME/.config/sh/path.sh ]; then
#   source $HOME/.config/sh/path.sh
# fi
### }}}

#export GUIX_DAEMON_SOCKET=guix://at111
#export GUIX_PROFILE=$HOME/.local/guix
#source $GUIX_PROFILE/etc/profile
# export PATH=$HOME/nix-boot/bin:$PATH
# export PKG_CONFIG_PATH=$HOME/nix-boot/lib/pkgconfig:$PKG_CONFIG_PATH
# export LDFLAGS="-L$HOME/nix-boot/lib $LDFLAGS"
# export CPPFLAGS="-I$HOME/nix-boot/include $CPPFLAGS"
# export PERL5OPT="-I$HOME/nix-boot/lib/perl -I$HOME/nix-boot/lib64/perl5 -I$HOME/nix-boot/lib/perl5 -I$HOME/nix-boot/lib/perl5/site_perl"
# export NIX_ROOT=$HOME/.local/nix
# export NIX_STORE_DIR=$NIX_ROOT/store
# export NIX_STATE_DIR=$NIX_ROOT/var/nix
# export NIX_DB_DIR=$NIX_ROOT/var/nix/db

#
### Appendix {{{
for i in $XDG_CONFIG_HOME/sh/profile.d/*.sh $XDG_CONFIG_HOME/sh/profile.d/*.zsh ; do
  if [ -r "$i" ]; then
    if [ "${-#*i}" != "$-" ]; then
      source "$i"
    else
      source "$i" >/dev/null
    fi
  fi
done
### }}}

# ### Local Setting {{{
if [ -e $HOME/.zshenv_local ]; then
  source $HOME/.zshenv_local
fi
### }}}

## automatically remove duplicates from these arrays
typeset -U path PATH
typeset -U ld_library_path LD_LIBRARY_PATH
typeset -U library_path LIBRARY_PATH
typeset -U cpath CPATH
typeset -U c_include_path C_INCLUDE_PATH
typeset -U cplus_include_path CPLUS_INCLUDE_PATH
typeset -U cdpath CDPATH
typeset -U fpath FPATH
typeset -U manpath MANPATH
typeset -U infopath INFOPATH
typeset -U pkg_config_path PKG_CONFIG_PATH

export PATH=$(echo $PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export LD_LIBRARY_PATH=$(echo $LD_LIBRARY_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export LIBRARY_PATH=$(echo $LIBRARY_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export CPATH=$(echo $CPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export C_INCLUDE_PATH=$(echo $C_INCLUDE_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export CPLUS_INCLUDE_PATH=$(echo $CPLUS_INCLUDE_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export CDPATH=$(echo $CDPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export FPATH=$(echo $FPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export MANPATH=$(echo $MANPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export INFOPATH=$(echo $INFOPATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')
export PKG_CONFIG_PATH=$(echo $PKG_CONFIG_PATH | sed -e 's/::/:/g' | sed 's/^://g' | sed 's/:$//g')


if [ $ZDOTDIR/.zshenv -nt $ZDOTDIR/.zshenv.zwc ]; then
  zcompile $ZDOTDIR/.zshenv
fi

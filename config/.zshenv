## zshenv
export ZDOTDIR=$HOME/.config/zsh
export ZDOTCACHE=$HOME/.cache/zsh
source $ZDOTDIR/.zshenv

## $ZDOTDIR/.zshenv
## Set up environment variables.

## $ZDOTDIR/.zprofile
## Set up aliases.

## $ZDOTDIR/.zshrc
## Set up other settings.

## $ZDOTDIR/.zlogout
## Set up finalizer.

## Case Login Shell (cf: ssh, tmux, screen, etc...)
## /etc/zshenv
## $ZDOTDIR/.zshenv
## /etc/zprofile
## $ZDOTDIR/.zprofile
## /etc/zshrc
## $ZDOTDIR/.zshrc
## /etc/zlogin
## $ZDOTDIR/.zlogin

## Case Interactive Shell (cf: bash, zsh, etc...)
## /etc/zshenv
## $ZDOTDIR/.zshenv
## /etc/zshrc
## $ZDOTDIR/.zshrc

## Case Shell Script
## /etc/zshenv
## $ZDOTDIR/.zshenv

## Case Logout
## $ZDOTDIR/.zlogout
## /etc/zlogout

if [ -e /home/users/kmoto/.nix-profile/etc/profile.d/nix.sh ]; then . /home/users/kmoto/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

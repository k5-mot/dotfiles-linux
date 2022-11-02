#!/usr/bin/env bash

## Aliases
if [ -x /usr/bin/dircolors ]; then
  test -r $XDG_CONFIG_HOME/dircolors && eval "$(dircolors -b $XDG_CONFIG_HOME/dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -CF --color=auto'
  alias ll='ls -alF --color=auto'
  alias la='ls -A --color=auto'
  alias lla='ls -la --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias ls='ls -CF'
  alias ll='ls -alF'
  alias la='ls -A'
  alias lla='ls -la'
fi
alias x=exit
alias osinfo='cat /etc/*-release'
# alias cd='cd -P'
alias lt='exa --tree --icons'



## Functions
benchmark_zsh-vanilla() {
  touch /tmp/.zshrc
  touch /tmp/.zshenv
  for i in $(seq 1 10); do
    time ( ZDOTDIR=/tmp/ zsh -i -c exit; )
  done
}


benchmark_zsh() {
  for i in $(seq 1 10); do
    time ( zsh -i -c exit )
  done
}

benchmark_bash() {
  for i in $(seq 1 10); do
    time ( bash -i -c exit )
  done
}

benchmark_vim() {
  # vim --cmd "profile start $XDG_CACHE_HOME/vim/profile.log" --cmd 'profile func *' --cmd 'profile file *' -c 'profdel func *' -c 'profdel file *' -c 'qa!'
  for i in $(seq 1 10); do
    time ( vim --startuptime $XDG_CACHE_HOME/vim/profile.log -c "qa!" )
  done
  # cat "$XDG_CACHE_HOME/vim/profile.log"
}

benchmark_nvim() {
  # nvim --cmd "profile start $XDG_CACHE_HOME/nvim/profile.log" --cmd 'profile func *' --cmd 'profile file *' -c 'profdel func *' -c 'profdel file *' -c 'qa!'
  for i in $(seq 1 10000); do
    time ( nvim --startuptime $XDG_CACHE_HOME/nvim/profile.log -c "qa!" )
  done
  # cat "$XDG_CACHE_HOME/nvim/profile.log"
}

path_append() {
  path_remove $1;
  export PATH="$PATH:$1";
}

path_prepend() {
  path_remove $1;
  export PATH="$1:$PATH";
}

path_remove() {
  export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`;
}

path_split() {
  sed -e "s/:/\n/g";
}

print_colors() {
  # From https://github.com/eendroroy/bin_scripts/blob/master/public/print_colors
  # with Do What The F*ck You Want To Public License
  echo -e "|039| \033[39mDefault \033[m  |049| \033[49mDefault \033[m  |037| \033[37mLight gray \033[m     |047| \033[47mLight gray \033[m"
  echo -e "|030| \033[30mBlack \033[m    |040| \033[40mBlack \033[m    |090| \033[90mDark gray \033[m      |100| \033[100mDark gray \033[m"
  echo -e "|031| \033[31mRed \033[m      |041| \033[41mRed \033[m      |091| \033[91mLight red \033[m      |101| \033[101mLight red \033[m"
  echo -e "|032| \033[32mGreen \033[m    |042| \033[42mGreen \033[m    |092| \033[92mLight green \033[m    |102| \033[102mLight green \033[m"
  echo -e "|033| \033[33mYellow \033[m   |043| \033[43mYellow \033[m   |093| \033[93mLight yellow \033[m   |103| \033[103mLight yellow \033[m"
  echo -e "|034| \033[34mBlue \033[m     |044| \033[44mBlue \033[m     |094| \033[94mLight blue \033[m     |104| \033[104mLight blue \033[m"
  echo -e "|035| \033[35mMagenta \033[m  |045| \033[45mMagenta \033[m  |095| \033[95mLight magenta \033[m  |105| \033[105mLight magenta \033[m"
  echo -e "|036| \033[36mCyan \033[m     |046| \033[46mCyan \033[m     |096| \033[96mLight cyan \033[m     |106| \033[106mLight cyan \033[m"

  # Added print (with little own mods)
  # from https://github.com/alacritty/alacritty/pull/3423#issuecomment-604703230
  echo -e "\e[1m\e[99mdef\e[0m\e[90mfoo\e[91mbar\e[92mbaz\e[93mbat\e[94mbax\e[95mbal\e[96mbag\e[97mban"
  echo -e "\e[39mdef\e[30mfoo\e[31mbar\e[32mbaz\e[33mbat\e[34mbax\e[35mbal\e[36mbag\e[37mban"
  echo -e "\e[2m\e[39mdef\e[30mfoo\e[31mbar\e[32mbaz\e[33mbat\e[34mbax\e[35mbal\e[36mbag\e[37mban"
  echo -e "\e[0m"
}

print-emoji1() {
    for i in {$((16#0000203C))..$((16#00003299))}; do
        echo -n -e "$(printf '\\U%x' $i) ";
    done
    for i in {$((16#0001F004))..$((16#0001FA95))}; do
        echo -n -e "$(printf '\\U%x' $i) ";
    done
}

print-emoji() {
    curl https://unicode.org/Public/emoji/15.0/emoji-test.txt | cat
}

print-color() {
    curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash
}


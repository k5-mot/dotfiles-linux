#!/usr/bin/env bash

##
## asdf
##
## URL: https://asdf-vm.com/
## Git: https://github.com/asdf-vm/asdf
##

function install-via-pip3() {
    pip3 install --upgrade pip
    pip3 install flake8
    pip3 install autopep8
    pip3 install jupyter
    pip3 install neovim
    pip3 install matplotlib
    pip3 install numpy
    pip3 install scipy
    pip3 install pandas
    pip3 install torch
    pip3 install torchvision
    pip3 install tensorflow
}

function install-via-gem() {
    gem install neovim
}

function install-via-npm() {
    npm install --global npm
    npm install --global yarn
    npm install --global neovic
    npm install --global gtop
}

function install-via-cargo() {
    cargo install exa
    cargo install bat
    cargo install hexyl
    cargo install procs
    cargo install ripgrep
}

function setup-asdf() {
    export INSTALL_LOG=$XDG_CACHE_HOME/asdf/install.log
    mkdir -pv $XDG_CACHE_HOME/asdf
    touch     $INSTALL_LOG

    echo "Setup"
    echo "Setup" 1>> $INSTALL_LOG
    rm -rfv   $XDG_DATA_HOME/asdf 1>> $INSTALL_LOG 2>&1

    echo "Download"
    echo "Download" 1>> $INSTALL_LOG

    git clone --verbose https://github.com/asdf-vm/asdf.git $XDG_DATA_HOME/asdf --branch v0.10.2 1>> $INSTALL_LOG 2>&1
    . $XDG_DATA_HOME/asdf/asdf.sh 1>> $INSTALL_LOG 2>&1

    echo "Install plugins"
    echo "Install plugins" 1>> $INSTALL_LOG 2>&1

    asdf plugin add python     https://github.com/danhper/asdf-python.git             # 1>> $INSTALL_LOG 2>&1
    asdf plugin add ruby       https://github.com/asdf-vm/asdf-ruby.git               # 1>> $INSTALL_LOG 2>&1
    asdf plugin add nodejs     https://github.com/asdf-vm/asdf-nodejs.git             # 1>> $INSTALL_LOG 2>&1
    asdf plugin add rust       https://github.com/code-lever/asdf-rust.git            # 1>> $INSTALL_LOG 2>&1
    asdf plugin add go         https://github.com/kennyp/asdf-golang.git              # 1>> $INSTALL_LOG 2>&1
    asdf plugin add java       https://github.com/halcyon/asdf-java.git               # 1>> $INSTALL_LOG 2>&1
    asdf plugin add julia      https://github.com/rkyleg/asdf-julia.git               # 1>> $INSTALL_LOG 2>&1
    asdf plugin add zig        https://github.com/cheetah/asdf-zig.git                # 1>> $INSTALL_LOG 2>&1
    asdf plugin add jq         https://github.com/azmcode/asdf-jq.git                 # 1>> $INSTALL_LOG 2>&1
    asdf plugin add peco       https://github.com/asdf-community/asdf-peco.git        # 1>> $INSTALL_LOG 2>&1
    asdf plugin add git        https://gitlab.com/jcaigitlab/asdf-git.git             # 1>> $INSTALL_LOG 2>&1
    asdf plugin add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git # 1>> $INSTALL_LOG 2>&1
    asdf plugin add fzf        https://github.com/kompiro/asdf-fzf.git                # 1>> $INSTALL_LOG 2>&1
    asdf plugin add ghq        https://github.com/kajisha/asdf-ghq.git                # 1>> $INSTALL_LOG 2>&1
    asdf plugin add vim        https://github.com/tsuyoshicho/asdf-vim.git            # 1>> $INSTALL_LOG 2>&1
    asdf plugin add neovim     https://github.com/richin13/asdf-neovim.git            # 1>> $INSTALL_LOG 2>&1
    asdf plugin add tmux       https://github.com/aphecetche/asdf-tmux.git

    echo "Install env"
    echo "Install env" 1>> $INSTALL_LOG 2>&1

    asdf install python     3.9.13           1>> $INSTALL_LOG 2>&1 #&
    asdf install ruby       3.1.2            1>> $INSTALL_LOG 2>&1 #&
    asdf install nodejs     16.17.0          1>> $INSTALL_LOG 2>&1 #&
    asdf install rust       1.63.0           1>> $INSTALL_LOG 2>&1 #&
    asdf install go         1.18.5           1>> $INSTALL_LOG 2>&1 #&
    asdf install java       openjdk-18.0.2.1 1>> $INSTALL_LOG 2>&1 #&
    asdf install julia      latest           1>> $INSTALL_LOG 2>&1 #&
    asdf install zig        latest           1>> $INSTALL_LOG 2>&1 #&
    asdf install jq         latest           1>> $INSTALL_LOG 2>&1 #&
    asdf install git        latest           1>> $INSTALL_LOG 2>&1 #&
    asdf install github-cli latest           1>> $INSTALL_LOG 2>&1 #&
    asdf install fzf        latest           1>> $INSTALL_LOG 2>&1 #&
    asdf install ghq        latest           1>> $INSTALL_LOG 2>&1 #&
    asdf install vim        9.0.0000         1>> $INSTALL_LOG 2>&1 #&
    asdf install neovim     stable           1>> $INSTALL_LOG 2>&1 #&
    asdf install tmux       latest           1>> $INSTALL_LOG 2>&1 #&

    wait $!
    echo "  Installed: $?"
    echo "  Installed: $?" 1>> $INSTALL_LOG 2>&1

    echo "Setup env"
    echo "Setup env" 1>> $INSTALL_LOG

    asdf global  python     3.9.13           1>> $INSTALL_LOG 2>&1
    asdf global  ruby       3.1.2            1>> $INSTALL_LOG 2>&1
    asdf global  nodejs     16.17.0          1>> $INSTALL_LOG 2>&1
    asdf global  rust       1.63.0           1>> $INSTALL_LOG 2>&1
    asdf global  go         1.18.5           1>> $INSTALL_LOG 2>&1
    asdf global  java       openjdk-18.0.2.1 1>> $INSTALL_LOG 2>&1
    asdf global  julia      latest           1>> $INSTALL_LOG 2>&1
    asdf global  zig        latest           1>> $INSTALL_LOG 2>&1
    asdf global  jq         latest           1>> $INSTALL_LOG 2>&1
    asdf global  git        latest           1>> $INSTALL_LOG 2>&1
    asdf global  github-cli latest           1>> $INSTALL_LOG 2>&1
    asdf global  fzf        latest           1>> $INSTALL_LOG 2>&1
    asdf global  ghq        latest           1>> $INSTALL_LOG 2>&1
    asdf global  vim        9.0.0000         1>> $INSTALL_LOG 2>&1
    asdf global  neovim     stable           1>> $INSTALL_LOG 2>&1
    asdf global  tmux       latest           1>> $INSTALL_LOG 2>&1
}

set -x
setup-asdf

echo "Install packages"
echo "Install packages" 1>> $INSTALL_LOG 2>&1

install-via-pip3            1>> $INSTALL_LOG 2>&1 #&
install-via-gem             1>> $INSTALL_LOG 2>&1 #&
install-via-npm             1>> $INSTALL_LOG 2>&1 #&
install-via-cargo           1>> $INSTALL_LOG 2>&1 #&

wait $!
echo "  Installed: $?"
echo "  Installed: $?" 1>> $INSTALL_LOG 2>&1


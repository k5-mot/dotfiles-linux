#!/usr/bin/env bash

##
## asdf
##
## URL: https://asdf-vm.com/
## Git: https://github.com/asdf-vm/asdf
##

function install-via-pip() {
    python3 -m pip install --upgrade pip > /dev/null 2>&1
    python3 -m pip --version             # > /dev/null 2>&1
    python3 -m pip install flake8        > /dev/null 2>&1
    python3 -m pip install autopep8      > /dev/null 2>&1
    python3 -m pip install jupyter       > /dev/null 2>&1
    python3 -m pip install neovim        > /dev/null 2>&1
    python3 -m pip install matplotlib    > /dev/null 2>&1
    python3 -m pip install numpy         > /dev/null 2>&1
    python3 -m pip install scipy         > /dev/null 2>&1
    python3 -m pip install pandas        > /dev/null 2>&1
    # python3 -m pip install torch         > /dev/null 2>&1
    # python3 -m pip install torchvision   > /dev/null 2>&1
    # python3 -m pip install tensorflow    > /dev/null 2>&1
    python3 -m pip list                  # > /dev/null 2>&1
}

function install-via-gem() {
    gem update         > /dev/null 2>&1
    gem --version      # > /dev/null 2>&1
    gem install neovim > /dev/null 2>&1
    gem list           # > /dev/null 2>&1
}

function install-via-npm() {
    npm update  --global                   > /dev/null 2>&1
    npm install --global npm               > /dev/null 2>&1
    npm --version                          # > /dev/null 2>&1
    npm install --global yarn              > /dev/null 2>&1
    npm install --global neovim            > /dev/null 2>&1
    npm install --global eslint            > /dev/null 2>&1
    npm install --global gtop              > /dev/null 2>&1
    npm install --global --save-dev --save-exact prettier > /dev/null 2>&1
    npm install --global @fsouza/prettierd > /dev/null 2>&1
    npm list    --global                   # > /dev/null 2>&1
}

function install-via-cargo() {
    rustup update                    > /dev/null 2>&1
    cargo --version                  # > /dev/null 2>&1
    cargo install exa                > /dev/null 2>&1
    cargo install bat                > /dev/null 2>&1
    cargo install fd-find            > /dev/null 2>&1
    cargo install hexyl              > /dev/null 2>&1
    cargo install procs              > /dev/null 2>&1
    cargo install ripgrep            > /dev/null 2>&1
    cargo install sd                 > /dev/null 2>&1
    cargo install zoxide             > /dev/null 2>&1
    cargo install gitui              > /dev/null 2>&1
    cargo install svls               > /dev/null 2>&1
    cargo install texlab             > /dev/null 2>&1
    cargo install stylua             > /dev/null 2>&1
    cargo install delta              > /dev/null 2>&1
    cargo install sheldon            > /dev/null 2>&1
    cargo install alacritty          > /dev/null 2>&1
    cargo install starship  --locked > /dev/null 2>&1
    cargo install zellij    --locked > /dev/null 2>&1
    cargo --list            # > /dev/null 2>&1
}

function setup-asdf() {

    if [ -z $XDG_DATA_HOME ]; then
        export XDG_DATA_HOME=$HOME/.local/share
    fi

    echo -e "\e[34mSetup\e[m"
    rm -rfv   $XDG_DATA_HOME/asdf > /dev/null 2>&1

    echo -e "\e[34mDownload\e[m"

    git clone --verbose https://github.com/asdf-vm/asdf.git $XDG_DATA_HOME/asdf --branch v0.10.2 > /dev/null 2>&1
    . $XDG_DATA_HOME/asdf/asdf.sh               > /dev/null 2>&1
    . $XDG_DATA_HOME/asdf/completions/asdf.bash > /dev/null 2>&1

    echo -e "\e[34mAdd plugins\e[m"

    asdf plugin list all  > /dev/null 2>&1
    asdf plugin add python     https://github.com/danhper/asdf-python.git             > /dev/null 2>&1
    asdf plugin add ruby       https://github.com/asdf-vm/asdf-ruby.git               > /dev/null 2>&1
    asdf plugin add nodejs     https://github.com/asdf-vm/asdf-nodejs.git             > /dev/null 2>&1
    asdf plugin add rust       https://github.com/code-lever/asdf-rust.git            > /dev/null 2>&1
    asdf plugin add go         https://github.com/kennyp/asdf-golang.git              > /dev/null 2>&1
    asdf plugin add java       https://github.com/halcyon/asdf-java.git               > /dev/null 2>&1
    asdf plugin add julia      https://github.com/rkyleg/asdf-julia.git               > /dev/null 2>&1
    asdf plugin add deno       https://github.com/asdf-community/asdf-deno.git        > /dev/null 2>&1
    asdf plugin add lua        https://github.com/Stratus3D/asdf-lua.git              > /dev/null 2>&1
    asdf plugin add zig        https://github.com/cheetah/asdf-zig.git                > /dev/null 2>&1
    asdf plugin add jq         https://github.com/azmcode/asdf-jq.git                 > /dev/null 2>&1
    asdf plugin add peco       https://github.com/asdf-community/asdf-peco.git        > /dev/null 2>&1
    asdf plugin add git        https://gitlab.com/jcaigitlab/asdf-git.git             > /dev/null 2>&1
    asdf plugin add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git > /dev/null 2>&1
    asdf plugin add fzf        https://github.com/kompiro/asdf-fzf.git                > /dev/null 2>&1
    asdf plugin add ghq        https://github.com/kajisha/asdf-ghq.git                > /dev/null 2>&1
    asdf plugin add vim        https://github.com/tsuyoshicho/asdf-vim.git            > /dev/null 2>&1
    asdf plugin add neovim     https://github.com/richin13/asdf-neovim.git            > /dev/null 2>&1
    # asdf plugin add tmux       https://github.com/aphecetche/asdf-tmux.git            > /dev/null 2>&1
    asdf plugin list

    echo -e "\e[34mInstall env\e[m"

    asdf install python     3.9.14           > /dev/null 2>&1
    asdf install ruby       3.1.2            > /dev/null 2>&1
    asdf install nodejs     16.17.1          > /dev/null 2>&1
    asdf install rust       stable           > /dev/null 2>&1
    asdf install go         1.18.7           > /dev/null 2>&1
    asdf install java       openjdk-18.0.2.1 > /dev/null 2>&1
    asdf install julia      latest           > /dev/null 2>&1
    asdf install deno       latest           > /dev/null 2>&1
    asdf install lua        latest           > /dev/null 2>&1
    asdf install zig        latest           > /dev/null 2>&1
    asdf install jq         latest           > /dev/null 2>&1
    asdf install peco       latest           > /dev/null 2>&1
    asdf install git        latest           > /dev/null 2>&1
    asdf install github-cli latest           > /dev/null 2>&1
    asdf install fzf        latest           > /dev/null 2>&1
    asdf install ghq        latest           > /dev/null 2>&1
    asdf install vim        latest           > /dev/null 2>&1
    asdf install neovim     0.7.2            > /dev/null 2>&1
    # asdf install tmux       latest           > /dev/null 2>&1
    asdf list

    echo -e "\e[33m  Installed\e[m"

    echo -e "\e[34mSet env\e[m"

    asdf global  python     3.9.14           > /dev/null 2>&1
    asdf global  ruby       3.1.2            > /dev/null 2>&1
    asdf global  nodejs     16.17.1          > /dev/null 2>&1
    asdf global  rust       stable           > /dev/null 2>&1
    asdf global  go         1.18.7           > /dev/null 2>&1
    asdf global  java       openjdk-18.0.2.1 > /dev/null 2>&1
    asdf global  julia      latest           > /dev/null 2>&1
    asdf global  deno       latest           > /dev/null 2>&1
    asdf global  lua        latest           > /dev/null 2>&1
    asdf global  zig        latest           > /dev/null 2>&1
    asdf global  jq         latest           > /dev/null 2>&1
    asdf global  peco       latest           > /dev/null 2>&1
    asdf global  git        latest           > /dev/null 2>&1
    asdf global  github-cli latest           > /dev/null 2>&1
    asdf global  fzf        latest           > /dev/null 2>&1
    asdf global  ghq        latest           > /dev/null 2>&1
    asdf global  vim        latest           > /dev/null 2>&1
    asdf global  neovim     0.7.2            > /dev/null 2>&1
    asdf global  tmux       latest           > /dev/null 2>&1
    cat $HOME/.tool-versions

    asdf reshim python
    asdf reshim ruby
    asdf reshim nodejs
    asdf reshim rust
}

set -x
setup-asdf

echo -e "\e[34mInstall packages\e[m" > /dev/null 2>&1

install-via-pip
install-via-gem
install-via-npm
install-via-cargo
echo -e "\e[33m  Installed\e[m"

echo -e "\e[34mFinished\e[m"


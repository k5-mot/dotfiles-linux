
### ASDF
export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
export ASDF_DIR=$XDG_DATA_HOME/asdf
export ASDF_DATA_DIR=$ASDF_DIR
# export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=tool-version
if [ ! -d $ASDF_DIR ]; then
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch "v0.11.2"
fi
if [ -d $ASDF_DIR ]; then
    . $ASDF_DIR/asdf.sh
    export FPATH="$ASDF_DIR/completions:$FPATH"
    if [ -d $ASDF_DIR/installs/rust ]; then
        export PATH=$ASDF_DIR/installs/rust/stable/bin:$PATH
        source $ASDF_DIR/installs/rust/stable/env
        if [ -d $HOME/.local/share/cargo ]; then
          export PATH=$HOME/.local/share/cargo/bin:$PATH
        fi
      fi
    if [ -d $ASDF_DIR/installs/nodejs ]; then
        if [ -d $XDG_DATA_HOME/npm ]; then
            export PATH=$XDG_DATA_HOME/npm/bin:$PATH
        fi
    fi
fi


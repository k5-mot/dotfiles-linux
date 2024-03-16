curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher



set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

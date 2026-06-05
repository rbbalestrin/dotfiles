# Linux-specific shell config.

# Omarchy, when installed.
export OMARCHY_PATH="$HOME/.local/share/omarchy"
[ -d "$OMARCHY_PATH/bin" ] && export PATH="$OMARCHY_PATH/bin:$PATH"
[ -s "$OMARCHY_PATH/default/bash/rc" ] && . "$OMARCHY_PATH/default/bash/rc"

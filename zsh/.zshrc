DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

case "$(uname -s)" in
  Darwin) [ -s "$DOTFILES_DIR/shell/macos.sh" ] && . "$DOTFILES_DIR/shell/macos.sh" ;;
  Linux)
    [ -s "$DOTFILES_DIR/shell/linux.sh" ] && . "$DOTFILES_DIR/shell/linux.sh"
    if grep -qi microsoft /proc/version 2>/dev/null; then
      [ -s "$DOTFILES_DIR/shell/wsl.sh" ] && . "$DOTFILES_DIR/shell/wsl.sh"
    fi
    ;;
esac

[ -s "$DOTFILES_DIR/shell/common.sh" ] && . "$DOTFILES_DIR/shell/common.sh"

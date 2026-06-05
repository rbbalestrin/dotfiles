# Shared shell config for macOS/Linux/WSL.

# Local bins
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL/bin" ] && export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) [ -d "$PNPM_HOME" ] && export PATH="$PNPM_HOME:$PATH" ;;
esac

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# envman
[ -s "$HOME/.config/envman/load.sh" ] && . "$HOME/.config/envman/load.sh"

# tmux session helper
ts() {
  if [ $# -eq 0 ]; then
    echo "uso: ts <nome-da-sessao>"
    tmux ls 2>/dev/null || true
    return 2
  fi
  local name="$1"
  if tmux has-session -t "$name" 2>/dev/null; then
    tmux attach -t "$name"
  else
    tmux new -s "$name"
  fi
}

gac() {
  if [ -z "$1" ]; then
    echo 'Uso: gac "mensagem do commit"'
    return 1
  fi
  git add . && git commit -m "$*"
}

alias tls='tmux ls'
alias tn='tmux new -s'
alias ta='tmux attach-session -t'
alias sail='vendor/bin/sail'

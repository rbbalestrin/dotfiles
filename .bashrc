# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/renan/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# functions
ts() {
  if [[ $# -eq 0 ]]; then
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
    echo "Uso: gac \"mensagem do commit\""
    return 1
  fi
  git add . && git commit -m "$*"
}

# alias
alias music='spotify_player'
alias Todoist="/home/renan/Applications/Todoist_4715f29c0bcd905a9a24c7f1976081ac.AppImage"
alias tls='tmux ls'
alias tn='tmux new -s'
alias ta='tmux attach-session -t'
alias sail='vendor/bin/sail'

# added
export OMARCHY_PATH=~/.local/share/omarchy
export PATH=$OMARCHY_PATH/bin:$PATH

#.env
export GEMINI_API_KEY="AIzaSyCWrHbdGBTJZ-VpiuyGjVcfvP9XeST6-zA"

#stail

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/.local/bin:$PATH"


#!/usr/bin/env bash
set -euo pipefail

CATEGORIES=("VIM" "WORK" "WASTED" "STOP")

selected=$(printf "%s\n" "${CATEGORIES[@]}" | sk --margin 10% --color="bw" --bind="q:quit") || exit 0

tmux_running() { tmux -q has-session 2>/dev/null; }

set_status() {
  if tmux_running; then
    tmux set -g status-right "${1:-}"
  fi
}

block_domains=(
  youtube.com www.youtube.com m.youtube.com studio.youtube.com youtu.be
  i.ytimg.com s.ytimg.com yt3.ggpht.com
  reddit.com www.reddit.com
  x.com www.x.com twitter.com www.twitter.com
  linkedin.com www.linkedin.com
  privatemail.com www.privatemail.com
  discord.com status.discord.com cdn.discordapp.com media.discordapp.net
  latency.discord.media gateway.discord.gg discordapp.com
)

block() {
  for d in "${block_domains[@]}"; do
    sudo hostess add "$d" 127.0.0.1
  done
}

unblock() {
  for d in "${block_domains[@]}"; do
    sudo hostess rm "$d" || true
  done
}

if [[ "$selected" == "STOP" ]]; then
  timew stop
  set_status ""
else
  timew start "$selected"
  set_status "$selected "
  if [[ "$selected" == "WASTED" ]]; then
    unblock
  else
    block
  fi
fi

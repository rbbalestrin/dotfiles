#!/usr/bin/env bash
set -euo pipefail

dir="${HOME}/Pictures/colection"

if [ ! -d "$dir" ]; then
  notify-send "Coleção" "Pasta não encontrada: $dir"
  exit 1
fi

if command -v fd >/dev/null 2>&1; then
  list_cmd="fd -t f -e jpg -e jpeg -e png -e gif -e webp . \"$dir\""
else
  list_cmd="find \"$dir\" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' \)"
fi

choice="$(eval "$list_cmd" | sort | rofi -dmenu -i -p 'Copiar imagem:')"
[ -z "${choice:-}" ] && exit 0

# Detecta mime e copia como imagem para o clipboard Wayland
mime="$(file --mime-type -b "$choice")"
# wl-copy -t image/png funciona bem; se não for png, usamos o mime detectado
if [[ "$mime" == image/* ]]; then
  wl-copy -t "$mime" <"$choice"
  notify-send "Copiada" "$(basename "$choice") para o clipboard"
else
  notify-send "Erro" "Arquivo não é imagem: $(basename "$choice")"
  exit 1
fi

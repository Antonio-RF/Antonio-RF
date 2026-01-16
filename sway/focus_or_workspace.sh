#!/usr/bin/env bash

direction="$1"

# Tenta focar a janela na direção desejada
if swaymsg "focus $direction" | grep -q '"success": true'; then
    exit 0
fi

# Se não existir janela naquela direção → troca workspace
if [ "$direction" = "left" ]; then
    swaymsg workspace prev
elif [ "$direction" = "right" ]; then
    swaymsg workspace next
elif [ "$direction" = "up" ]; then
    swaymsg workspace prev
elif [ "$direction" = "down" ]; then
    swaymsg workspace next
fi

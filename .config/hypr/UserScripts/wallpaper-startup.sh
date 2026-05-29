#!/bin/bash

STATE="$HOME/.cache/wallpaper_enabled"
SCRIPT="$HOME/.config/hypr/UserScripts/mpvpaper-auto.sh"

case "$1" in

    --on)

        touch "$STATE"

        pkill mpvpaper
        pkill -f mpvpaper-auto.sh

        nohup "$SCRIPT" >/dev/null 2>&1 &
        ;;

    --off)

        rm -f "$STATE"

        pkill mpvpaper
        pkill -f mpvpaper-auto.sh
        ;;

    --boot)

        if [ -f "$STATE" ]; then
            sleep 3
            pgrep -f mpvpaper-auto.sh || nohup "$SCRIPT" >/dev/null 2>&1 &
        fi
        ;;

    *)

        echo "Usage: wallpaper --on|--off"
        ;;
esac

#!/bin/bash

video="$HOME/Videos/Wallpaper/output.mp4"
video2="$HOME/Videos/furina_edit/Furina Montagem Shirt Blue! 😳.mp4"

while true; do
    active=$(hyprctl activeworkspace -j | jq '.id')

    windows=$(hyprctl clients -j | jq "[.[]
        | select(
            .workspace.id == $active and
            .mapped == true and
            .hidden == false and
            .class != \"mpvpaper\"
        )
    ] | length")

    running=$(pgrep -x mpvpaper)

    if [ "$windows" -gt 0 ]; then

        if [ ! -z "$running" ]; then
            pkill -SIGTERM mpvpaper
        fi

    else

        if [ -z "$running" ]; then
            mpvpaper -o "loop hwdec=auto" eDP-1 "$video2" &
        fi

    fi

    sleep 2
done

#!/bin/bash

wal -q -n -i ~/Pictures/Wallpapers/cindy.png

sleep 1

source="$HOME/.cache/wal/colors.sh"

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/ && ~/.config/waybar/launch_waybar.sh

cp ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/alacritty.toml

cp ~/.cache/wal/colors-starship.conf ~/.config/starship.toml

cp ~/.cache/wal/colors-cava.conf ~/.config/cava/config
pkill -USR2 cava # Reloads cava's colorscheme configuration

mpvpaper -o "no-audio --loop-playlist" '*' /home/mamat/Videos/Wallpapers/cindy_animated.mp4

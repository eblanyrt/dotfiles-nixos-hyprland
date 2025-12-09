
#
#                   $$\                          $$\                                                 $$\
#                   $$ |                         $$ |                                                $$ |
#        $$$$$$$\ $$$$$$\    $$$$$$\   $$$$$$\ $$$$$$\   $$\   $$\  $$$$$$\  $$\  $$\  $$\  $$$$$$\  $$ |         $$$$$$$\ $$\  $$\  $$\ $$\  $$\  $$\ $$\  $$\  $$\ 
#       $$  _____|\_$$  _|   \____$$\ $$  __$$\\_$$  _|  $$ |  $$ |$$  __$$\ $$ | $$ | $$ | \____$$\ $$ |$$$$$$\ $$  _____|$$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#       \$$$$$$\    $$ |     $$$$$$$ |$$ |  \__| $$ |    $$ |  $$ |$$ /  $$ |$$ | $$ | $$ | $$$$$$$ |$$ |\______|\$$$$$$\  $$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#        \____$$\   $$ |$$\ $$  __$$ |$$ |       $$ |$$\ $$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |         \____$$\ $$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#       $$$$$$$  |  \$$$$  |\$$$$$$$ |$$ |       \$$$$  |\$$$$$$  |$$$$$$$  |\$$$$$\$$$$  |\$$$$$$$ |$$ |        $$$$$$$  |\$$$$$\$$$$  |\$$$$$\$$$$  |\$$$$$\$$$$  |
#       \_______/    \____/  \_______|\__|        \____/  \______/ $$  ____/  \_____\____/  \_______|\__|        \_______/  \_____\____/  \_____\____/  \_____\____/ 
#                                                                  $$ |
#                                                                  $$ |
#                                                                  \__|
#
#       by Eblanyrt (2025)
#

#!/bin/bash

swww img --transition-type grow --transition-pos 0.054,0.977 --transition-fps 58 ~/Pictures/Wallpapers/TA.jpg && wal -q -n -i ~/Pictures/Wallpapers/TA.jpg

sleep 1

source="$HOME/.cache/wal/colors.sh"

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/ && ~/.config/waybar/launch_waybar.sh

cp ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/alacritty.toml

cp ~/.cache/wal/colors-starship.conf ~/.config/starship.toml

cp ~/.cache/wal/colors-cava.conf ~/.config/cava/config
pkill -USR2 cava # Reloads cava's colorscheme configuration

echo "DONE!"

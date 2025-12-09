
#
#                                          $$\                                                 $$\                                                             
#                                          $$ |                                                $$ |                                                            
#        $$$$$$\  $$$$$$\  $$$$$$$\   $$$$$$$ | $$$$$$\  $$$$$$\$$$$\  $$\  $$\  $$\  $$$$$$\  $$ |         $$$$$$$\ $$\  $$\  $$\ $$\  $$\  $$\ $$\  $$\  $$\ 
#       $$  __$$\ \____$$\ $$  __$$\ $$  __$$ |$$  __$$\ $$  _$$  _$$\ $$ | $$ | $$ | \____$$\ $$ |$$$$$$\ $$  _____|$$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#       $$ |  \__|$$$$$$$ |$$ |  $$ |$$ /  $$ |$$ /  $$ |$$ / $$ / $$ |$$ | $$ | $$ | $$$$$$$ |$$ |\______|\$$$$$$\  $$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#       $$ |     $$  __$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$ | $$ | $$ |$$  __$$ |$$ |         \____$$\ $$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#       $$ |     \$$$$$$$ |$$ |  $$ |\$$$$$$$ |\$$$$$$  |$$ | $$ | $$ |\$$$$$\$$$$  |\$$$$$$$ |$$ |        $$$$$$$  |\$$$$$\$$$$  |\$$$$$\$$$$  |\$$$$$\$$$$  |
#       \__|      \_______|\__|  \__| \_______| \______/ \__| \__| \__| \_____\____/  \_______|\__|        \_______/  \_____\____/  \_____\____/  \_____\____/ 
#
#       by Eblanyrt (2025)


#!/run/current-system/sw/bin/bash

wal -q -n -i ~/Pictures/Wallpapers/

source $HOME/.cache/wal/colors.sh

swww img --transition-type grow --transition-pos 0.054,0.977 --transition-fps 58 $wallpaper

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/ && ~/.config/waybar/launch_waybar.sh
cp ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.cache/wal/colors-starship.conf ~/.config/starship.toml
cp ~/.cache/wal/colors-cava.conf ~/.config/cava/config
pkill -USR2 cava # Reloads cava's colorscheme configuration

# notify-send -t 2000 "Wallpaper has succesfully changed!"

echo "DONE!"

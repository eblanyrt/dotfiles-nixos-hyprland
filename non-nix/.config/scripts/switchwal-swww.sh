
#
#                               $$\   $$\               $$\                               $$\
#                               \__|  $$ |              $$ |                              $$ |
#        $$$$$$$\ $$\  $$\  $$\ $$\ $$$$$$\    $$$$$$$\ $$$$$$$\  $$\  $$\  $$\  $$$$$$\  $$ |         $$$$$$$\ $$\  $$\  $$\ $$\  $$\  $$\ $$\  $$\  $$\ 
#       $$  _____|$$ | $$ | $$ |$$ |\_$$  _|  $$  _____|$$  __$$\ $$ | $$ | $$ | \____$$\ $$ |$$$$$$\ $$  _____|$$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#       \$$$$$$\  $$ | $$ | $$ |$$ |  $$ |    $$ /      $$ |  $$ |$$ | $$ | $$ | $$$$$$$ |$$ |\______|\$$$$$$\  $$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#        \____$$\ $$ | $$ | $$ |$$ |  $$ |$$\ $$ |      $$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |         \____$$\ $$ | $$ | $$ |$$ | $$ | $$ |$$ | $$ | $$ |
#       $$$$$$$  |\$$$$$\$$$$  |$$ |  \$$$$  |\$$$$$$$\ $$ |  $$ |\$$$$$\$$$$  |\$$$$$$$ |$$ |        $$$$$$$  |\$$$$$\$$$$  |\$$$$$\$$$$  |\$$$$$\$$$$  |
#       \_______/  \_____\____/ \__|   \____/  \_______|\__|  \__| \_____\____/  \_______|\__|        \_______/  \_____\____/  \_____\____/  \_____\____/ 
#
#       by Eblanyrt (2025)
#

#!/run/current-system/sw/bin/bash

selected_file_path="$1"

#swww img --transition-type wipe --transition-step 20 --transition-fps 60 $selected_file_path && wal -q -i $selected_file_path
swww img --transition-type grow --transition-pos 0.054,0.977 --transition-fps 58 $selected_file_path && wal -q -n -i $selected_file_path


#source="$HOME/.cache/wal/colors.sh"

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/ && ~/.config/waybar/launch_waybar.sh
cp ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.cache/wal/colors-starship.conf ~/.config/starship.toml
cp ~/.cache/wal/colors-cava.conf ~/.config/cava/config
pkill -USR2 cava # Reloads cava's colorscheme configuration

# notify-send -t 2000 "Wallpaper has succesfully changed!"

echo "DONE!"

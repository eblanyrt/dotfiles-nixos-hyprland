
#
#                           $$\                       $$\                                   $$\ $$\                                                   
#                           $$ |                      $$ |                                  $$ |$$ |                                                  
#        $$$$$$$\  $$$$$$\  $$ | $$$$$$\   $$$$$$$\ $$$$$$\         $$\  $$\  $$\  $$$$$$\  $$ |$$ | $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\  
#       $$  _____|$$  __$$\ $$ |$$  __$$\ $$  _____|\_$$  _|$$$$$$\ $$ | $$ | $$ | \____$$\ $$ |$$ |$$  __$$\  \____$$\ $$  __$$\ $$  __$$\ $$  __$$\ 
#       \$$$$$$\  $$$$$$$$ |$$ |$$$$$$$$ |$$ /        $$ |  \______|$$ | $$ | $$ | $$$$$$$ |$$ |$$ |$$ /  $$ | $$$$$$$ |$$ /  $$ |$$$$$$$$ |$$ |  \__|
#        \____$$\ $$   ____|$$ |$$   ____|$$ |        $$ |$$\       $$ | $$ | $$ |$$  __$$ |$$ |$$ |$$ |  $$ |$$  __$$ |$$ |  $$ |$$   ____|$$ |      
#       $$$$$$$  |\$$$$$$$\ $$ |\$$$$$$$\ \$$$$$$$\   \$$$$  |      \$$$$$\$$$$  |\$$$$$$$ |$$ |$$ |$$$$$$$  |\$$$$$$$ |$$$$$$$  |\$$$$$$$\ $$ |      
#       \_______/  \_______|\__| \_______| \_______|   \____/        \_____\____/  \_______|\__|\__|$$  ____/  \_______|$$  ____/  \_______|\__|      
#                                                                                                   $$ |                $$ |                          
#                                                                                                   $$ |                $$ |                          
#                                                                                                   \__|                \__|                          
#
#       by Eblanyrt (2025)
#

#!/run/current-system/sw/bin/bash

# Wallpaper directory
WALLPAPER_DIR="/home/mamat/Pictures/Wallpapers"

# Check directory
if [[ ! -d "$WALLPAPER_DIR" ]]; then
    notify-send "Folder not found: $WALLPAPER_DIR"
    exit 1
fi

# Take file list from directory
files=$(ls "$WALLPAPER_DIR")

# If there's no wallpaper
if [[ -z "$files" ]]; then
    notify-send "There's no file in $WALLPAPER_DIR"
    exit 0
fi

# Show menu using Rofi
#selected_file=$(echo "$files" | rofi -dmenu -p "Choose Wallpaper:")

# Show menu using Wofi
selected_file=$(echo "$files" | wofi --show dmenu -p "Choose Wallpaper:")

# If user cancels selection
if [[ -z "$selected_file" ]]; then
    exit 0
fi

# Full path to chosen file
selected_file_path="$WALLPAPER_DIR/$selected_file"

# Pass the variable to switchwal-swww.sh
/home/mamat/.config/scripts/switchwal-swww.sh "$selected_file_path"

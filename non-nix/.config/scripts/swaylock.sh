
#
#		                                            $$\                     $$\       
#		                                            $$ |                    $$ |      
#		 $$$$$$$\ $$\  $$\  $$\  $$$$$$\  $$\   $$\ $$ | $$$$$$\   $$$$$$$\ $$ |  $$\ 
#		$$  _____|$$ | $$ | $$ | \____$$\ $$ |  $$ |$$ |$$  __$$\ $$  _____|$$ | $$  |
#		\$$$$$$\  $$ | $$ | $$ | $$$$$$$ |$$ |  $$ |$$ |$$ /  $$ |$$ /      $$$$$$  / 
#		 \____$$\ $$ | $$ | $$ |$$  __$$ |$$ |  $$ |$$ |$$ |  $$ |$$ |      $$  _$$<  
#		$$$$$$$  |\$$$$$\$$$$  |\$$$$$$$ |\$$$$$$$ |$$ |\$$$$$$  |\$$$$$$$\ $$ | \$$\ 
#		\_______/  \_____\____/  \_______| \____$$ |\__| \______/  \_______|\__|  \__|
#		                                  $$\   $$ |                                  
#		                                  \$$$$$$  |                                  
#		                                   \______/                                   
#
#		by Eblanyrt (2025)
#

#!/bin/bash

source ~/.cache/wal/colors.sh

swaylock \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 110 \
	--indicator-thickness 9 \
	--text-color $foreground \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--ring-color $color1 \
	--key-hl-color $color11 \
	--line-color $color1 \
	--inside-color 00000088 \
	--separator-color $color5

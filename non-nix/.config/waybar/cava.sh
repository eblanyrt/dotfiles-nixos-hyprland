#!/bin/sh

# Terminate already running cava instances
pkill -f "cava -p /tmp/cava_config"

bar="▁▂▃▄▅▆▇█"
dict="s/;//g"

bar_length=${#bar}

# Create dictionary to replace char with bar
for ((i = 0; i < bar_length; i++)); do
    dict+=";s/$i/${bar:$i:1}/g"
done

config_file="/tmp/cava_config"
cat >"$config_file" <<EOF
[general]
bars = 17

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7

EOF

cava -p "$config_file" | sed -u "$dict"

# #! /bin/bash

# bar="▁▂▃▄▅▆▇█"
# #bar =0.5
# dict="s/;//g;"

# # creating "dictionary" to replace char with bar
# i=0
# while [ $i -lt ${#bar} ]
# do
#     dict="${dict}s/$i/${bar:$i:1}/g;"
#     i=$((i=i+1))
# done

# # make sure to clean pipe
# pipe="/tmp/cava.fifo"
# if [ -p $pipe ]; then
#     unlink $pipe
# fi
# mkfifo $pipe



# #method = raw

# # write cava config
# config_file="/tmp/waybar_cava_config"
# echo "
# [general]
# bars = 15
# bar_width = 1
# [input]
# method = pulse
# [output]
# method = raw
# raw_target = $pipe
# data_format = ascii
# ascii_max_range = 7
# " > $config_file

# # run cava in the background
# cava -p $config_file &

# # reading data from fifo
# while read -r cmd; do
#     echo $cmd | sed $dict
# done < $pipe
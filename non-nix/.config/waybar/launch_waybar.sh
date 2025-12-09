

# Terminate already running waybar instances
pkill waybar & sleep 0.5

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

# Launch Waybar
waybar &



#!/bin/bash

# GENERAL SCRIPTS 
# by Gabriel Quintana 

# AUDIO CONFIGURATIONS
# used for Void Linux:
#
# audio=(
#   "pipewire"
#   "wireplumber"
#   "pipewire-pulse"
# )
# 
# for servico in "${audio[@]}"; do
#   $servico &
#   sleep 0.8
# done


# WORKSPACES
# i3-msg "workspace 1; move workspace to output eDP-1" && sleep 0.8
# i3-msg "workspace 8; move workspace to HDMI-1" && sleep 0.8

# WALLPAPER 
# after workspaces config
feh --bg-fill $HOME/.config/i3/default.png

#!/bin/bash

# Assign workspaces to HDMI (up)
i3-msg "workspace 8; move workspace to output eDP-1"
sleep 0.8

# Assign workspaces to Notebook (down)
i3-msg "workspace 1; move workspace to output HDMI-1"
sleep 0.8

feh --bg-fill $HOME/.config/i3/rocket.png

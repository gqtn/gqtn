#!/bin/bash

# Assign workspaces to HDMI (up)
i3-msg "workspace 1; move workspace to output HDMI-A-0"

# Assign workspaces to Notebook (down)
i3-msg "workspace 8; move workspace to output eDP"

feh --bg-scale $HOME/.config/i3/void_path.svg

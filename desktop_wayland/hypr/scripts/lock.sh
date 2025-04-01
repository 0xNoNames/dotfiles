#!/bin/bash

saver_cmd="kitty -c ~/.config/hypr/scripts/kitty.conf --start-as=fullscreen ~/.config/hypr/scripts/screensaver.sh"
(hyprlock && killall kitty) &
eval "$saver_cmd" &

#!/usr/bin/env bash

# Terminate already running bars
killall -q polybar

# Launch new polybar(s)
if type "xrandr"; then
  IFS=$'\n' # must set internal field separator to avoid dumb
  for entry in $(xrandr --query | grep " connected"); do
    MONITOR=$(cut -d" " -f1 <<<"$entry")
    status=$(cut -d" " -f3 <<<"$entry")

    TRAY_POS=""
    if [ "$status" == "primary" ]; then
      TRAY_POS="right"
    fi

    MONITOR=$MONITOR TRAY_POS=$TRAY_POS polybar 2>&1 | tee -a /tmp/polybar-monitor-"$MONITOR".log &
    disown
  done
  unset IFS # avoid mega dumb by resetting the IFS
else
  polybar 2>&1 | tee -a /tmp/polybar.log &
  disown
fi

echo "Polybar launched..."

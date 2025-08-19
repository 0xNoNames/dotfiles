#!/usr/bin/env bash

selected=$(tmux ls -F '#{?session_attached,[ATTACHED] ,}#S' 2>/dev/null | sort --ignore-case | sk --tac)

if [[ -z $selected ]]; then
  exit 0
fi

tmux switch-client -t "$(echo "$selected" | tr -d '[]ATTACHED')"

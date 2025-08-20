#!/usr/bin/env bash

DIRS=(
  "$HOME/Projects"
  "$HOME/Gitlab"
  "$HOME/Github"
)

selected=$(
  (
    fd . "${DIRS[@]}" --type=dir --min-depth=1 --max-depth=1 --full-path 2>/dev/null |
      sed "s|^$HOME/||" |
      sort --ignore-case |
      {
        printf '%s\n' "home"
        cat -
      }
  ) |
    sk
)

[[ ! $selected ]] && exit 0

[[ $selected != "home" ]] && selected="$HOME/$selected"

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected_name"; then
  tmux new-session -ds "$selected_name" -c "$selected"
  tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"

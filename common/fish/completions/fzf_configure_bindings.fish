complete fzf_configure_bindings --no-files
complete fzf_configure_bindings --long directory --description "Change the key binding for Search Directory" --condition "not __fish_seen_argument --directory"
complete fzf_configure_bindings --long git_log --description "Change the key binding for Search Git Log" --condition "not __fish_seen_argument --git_log"
complete fzf_configure_bindings --long git_status --description "Change the key binding for Search Git Status" --condition "not __fish_seen_argument --git_status"
complete fzf_configure_bindings --long history --description "Change the key binding for Search History" --condition "not __fish_seen_argument --history"

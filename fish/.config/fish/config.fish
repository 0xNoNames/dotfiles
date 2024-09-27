# -- -- -- ENV -- -- -- #
set -gx TERM xterm-256color
set -gx EDITOR nvim
set -Ux fish_prompt_pwd_dir_length 0
set -Ux fish_greeting ''

if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

fzf_configure_bindings --directory=\cf

# -- -- -- ALIASES -- -- -- #
alias cat 'bat --theme=Dracula'
alias catp 'cat -pp'
alias vim nvim
alias vi nvim
alias ll 'eza -lgbF --icons --color=always --group-directories-first'
alias ls ll
alias lt 'll -TL'
alias la 'll -a'
alias lm 'la -r --sort=modified'
alias lta 'la -TL'
alias lx 'eza -lbhHigUmuSa@ --time-style=long-iso --color-scale --group-directories-first'
alias python python3


# -- -- -- FUNCTIONS -- -- -- #
# Add a new line after a command
function postexec_test --on-event fish_postexec
    echo
end

function wallpaper
    wallust run -s -C ~/.config/wallust/wallust.toml "$argv[1]"
    automator -i "$argv[1]" ~/Documents/wallpaper.workflow
    source ~/.cache/wal/colors.fish
end

# -- -- -- ENV -- -- -- #
set -gx TERM xterm-256color
set -gx EDITOR nvim
set -Ux fish_prompt_pwd_dir_length 0
set -Ux fish_greeting ''
set -Ux HOMEBREW_NO_AUTO_UPDATE 1
set -Ux EZA_COLORS "\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"
fish_config theme choose "Dracula Official"

# if test -e ~/.cache/wal/colors.fish
#     source ~/.cache/wal/colors.fish
# end

fzf_configure_bindings --directory=\cf
alias history _fzf_search_history

bind \cz 'fg 2>/dev/null; commandline -f repaint'

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
# function postexec_test --on-event fish_postexec
#     echo
# end

# function wallpaper
#     wallust run -s -C ~/.config/wallust/wallust.toml "$argv[1]"
#     automator -i "$argv[1]" ~/Documents/wallpaper.workflow
#     source ~/.cache/wal/colors.fish
# end

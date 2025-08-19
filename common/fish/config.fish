# -- -- -- ENV -- -- -- #
set -gx TERM xterm-256color
set -gx EDITOR nvim
set -Ux fish_prompt_pwd_dir_length 0
set -Ux fish_greeting ""
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

fish_config theme choose dracula

# -- -- -- BINDS -- -- -- #
bind \cz "fg 2>/dev/null; commandline -f repaint"
bind \cf "tmux neww $HOME/.config/scripts/tmux-sessionizer.sh"
bind \cs "tmux neww $HOME/.config/scripts/tmux-switcher.sh"

# -- -- -- ALIASES -- -- -- #
alias cat "bat --theme=Dracula"
alias catp "cat -pp"
alias vim nvim
alias vi nvim
alias ll "eza -lgbF --icons --color=always --group-directories-first"
alias ls ll
alias la "ll -a"
alias lt "ll -TL"
alias lta "la -TL"
alias gl "git log -a --oneline --graph"
alias lg lazygit
alias lazypod 'DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker'
alias lp lazypod

if status is-interactive
    and not set -q TMUX
    exec tmux new-session -As home
end

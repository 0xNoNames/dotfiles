set -gx TERM xterm-256color
set -gx EDITOR nvim
set -Ux fish_prompt_pwd_dir_length 0
set -Ux fish_greeting ''
set -Ux  EZA_COLORS "\
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
fzf_configure_bindings --directory=\cf

alias cat 'bat --theme=Dracula'
alias catp 'bat -pp'
alias vim 'nvim'
alias vi 'nvim'
alias ll 'eza -lgbF --icons --color=always --group-directories-first'
alias ls 'll'
alias lt 'll -TL'
alias la 'll -a'
alias lm 'la -r --sort=modified'
alias lta 'la -TL'
alias lx 'eza -lbhHigUmuSa@ --time-style=long-iso --color-scale --group-directories-first'
alias python 'python3'


# Add a new line after a command
function postexec_test --on-event fish_postexec
	echo
end


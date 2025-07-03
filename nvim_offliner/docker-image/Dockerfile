FROM --platform=linux/amd64 archlinux

RUN pacman -Syu --noconfirm git neovim gcc python nodejs npm unzip go

RUN useradd -ms /bin/bash user && mkdir /home/user/output
COPY pull_nvim.sh /home/user
WORKDIR /home/user
USER user

CMD  ["/home/user/pull_nvim.sh"]


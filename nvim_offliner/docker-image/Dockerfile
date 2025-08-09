FROM --platform=linux/amd64 archlinux

RUN rm -rf /etc/pacman.d/gnupg && pacman-key --init && pacman-key --populate archlinux
RUN pacman -Sy --noconfirm --needed archlinux-keyring && pacman -Su --noconfirm
RUN pacman -Syu --noconfirm git neovim gcc python nodejs npm unzip go rustup cargo make

RUN useradd -ms /bin/bash user && mkdir /home/user/output
COPY pull_nvim.sh /home/user
WORKDIR /home/user
USER user

CMD  ["/home/user/pull_nvim.sh"]


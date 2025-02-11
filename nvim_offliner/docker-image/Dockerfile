FROM archlinux

RUN pacman -Sy --noconfirm git neovim gcc python npm unzip

RUN useradd -ms /bin/bash user && mkdir /home/user/output
COPY pull_nvim.sh /home/user
WORKDIR /home/user
USER user

CMD  ["/home/user/pull_nvim.sh"]


#!/bin/bash

set -ex

mkdir -p output
chmod 777 output
podman build -t neovim-offliner:latest docker-image
podman run -it --rm -v $(pwd)/output/:/home/user/output/ neovim-offliner:latest
podman image rm neovim-offliner:latest

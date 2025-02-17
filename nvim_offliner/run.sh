#!/bin/bash

set -ex

mkdir -p output
chmod 777 output
docker build -t neovim-offliner:latest docker-image
docker run -it --rm -v $(pwd)/output/:/home/user/output/ neovim-offliner:latest
docker image rm neovim-offliner:latest

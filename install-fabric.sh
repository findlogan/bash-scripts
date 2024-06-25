#!/bin/bash

# Update APT
sudo apt update
sudo apt install -y pipx

# Clone github repository, install using pipx from previous step
git clone https://github.com/danielmiessler/fabric.git
cd fabric
pipx install .

# Refresh with new bashrc and setup fabric
source ~/.bashrc
fabric --setup

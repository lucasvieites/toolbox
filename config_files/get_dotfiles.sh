#! /bin/bash
# Fetches the files in this repository folder and saves them to your home folder
# REQUIREMENTS:
#    powerline
#    vim-enhanced
#    gruvbox colorscheme for vim

wget -q https://raw.githubusercontent.com/lucasvieites/toolbox/refs/heads/master/config_files/.bashrc -O ~/.bashrc
wget -q https://raw.githubusercontent.com/lucasvieites/toolbox/refs/heads/master/config_files/.bash_aliases -O .bash_aliases
wget -q https://raw.githubusercontent.com/lucasvieites/toolbox/refs/heads/master/config_files/.bash_profile -O .bash_profile
wget -q https://raw.githubusercontent.com/lucasvieites/toolbox/refs/heads/master/config_files/.profile -O .profile
wget -q https://raw.githubusercontent.com/lucasvieites/toolbox/refs/heads/master/config_files/.vimrc -O .vimrc

source  ~/.bashrc

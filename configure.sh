#!/bin/bash
#Bootstrap a basic desktop environment

#Install basic packages
packages="fluxbox feh rdesktop bash-completion tmux mutt gpgv chromium-browser gnome-terminal xfonts-terminus thunderbird git vim htop lxc-docker virt-manager build-essential arandr x11-xserver-utils xdg-utils keychain zsh"

sudo apt-get -y install ${packages}

#Make VIM the default editor
sudo update-alternatives --set editor /usr/bin/vim.basic

#Set Chromium as the default web browser
sudo update-alternatives --set x-www-browser /usr/bin/chromium-browser

if [ -x /usr/bin/xdg-mime ]; then
    /usr/bin/xdg-mime default chromium-browser.desktop x-scheme-handler/http
    /usr/bin/xdg-mime default chromium-browser.desktop x-scheme-handler/https
fi

#Link configuration files
config_files=".tmux.conf .vimrc .gpg_config .muttrc .Xdefaults .zshrc .bashrc"
for config_file in ${config_files}; do
    #Make sure the file isn't already a symlink
    if [ ! -h ${HOME}/${config_file} ]; then

        #If a file exists and is not a link move it out of the way
        if [ -f ${HOME}/${config_file} ]; then
            mv ${HOME}/${config_file} ${HOME}/${config_file}.bak
        fi

        #Link to our env dir
        ln -s ${HOME}/env/${config_file} ${HOME}/${config_file}
    fi
done

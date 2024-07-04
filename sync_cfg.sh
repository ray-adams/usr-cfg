#!/bin/sh

# Script Name: sync_usr_cfg.sh
# Script Path: <git_root>/sync_usr_cfg.sh
# Description: Sync user configuration files to <git_root>/<user>/

# Copyright 2024 Ray Adams
# SPDX-Licence-Identifier: BSD-3-Clause

# Version: 1.1.0

# Obtain the path for <git_root>
working_dir="$(git rev-parse --show-toplevel)"

# Colors
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'

cli() {
    # Create directories if they do not exist
    mkdir -p "${working_dir}/cli-usr/nvim/"
    mkdir -p "${working_dir}/cli-usr/zsh/"

    # Directories

    ## neovim
    echo "${green} Syncing neovim configuration files...${nc}"
    rsync -qru --delete \
        --exclude="spell" \
        --exclude="templates" \
        "${XDG_CONFIG_HOME}/nvim/" \
        "${working_dir}/cli-usr/nvim/"

    ## zsh
    echo "${green} Syncing zsh configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/zsh/" \
        "${working_dir}/cli-usr/zsh/"

    # Files
    
    ## user-dirs.dirs
    echo "${green} Syncing the user-dirs.dirs configuration file...${nc}"
    rsync -qu \
        "${XDG_CONFIG_HOME}/user-dirs.dirs" \
        "${working_dir}/cli-usr/"
}

tohka_s3() {
    # Create directories if they do not exist
    mkdir -p "${working_dir}/tohka-s3/alacritty/"
    mkdir -p "${working_dir}/tohka-s3/dunst/"
    mkdir -p "${working_dir}/tohka-s3/mpv/"
    mkdir -p "${working_dir}/tohka-s3/nvim/"
    mkdir -p "${working_dir}/tohka-s3/pipewire/"
    mkdir -p "${working_dir}/tohka-s3/sway/"
    mkdir -p "${working_dir}/tohka-s3/waybar/"
    mkdir -p "${working_dir}/tohka-s3/wireplumber/"
    mkdir -p "${working_dir}/tohka-s3/zathura/"
    mkdir -p "${working_dir}/tohka-s3/zsh/"

    # Directories
    
    ## alacritty
    echo "${green} Syncing alacritty configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/alacritty/" \
        "${working_dir}/tohka-s3/alacritty/"

    ## dunst
    echo "${green} Syncing dunst configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/dunst/" \
        "${working_dir}/tohka-s3/dunst/"

    ## mpv
    echo "${green} Syncing mpv configuration files...${nc}"
    rsync -qru --delete \
        --exclude="watch_later" \
        "${XDG_CONFIG_HOME}/mpv/" \
        "${working_dir}/tohka-s3/mpv/"

    ## neovim
    echo "${green} Syncing neovim configuration files...${nc}"
    rsync -qru --delete \
        --exclude="spell" \
        --exclude="templates" \
        "${XDG_CONFIG_HOME}/nvim/" \
        "${working_dir}/tohka-s3/nvim/"


    ## pipewire
    echo "${green} Syncing pipewire configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/pipewire/" \
        "${working_dir}/tohka-s3/pipewire/"

    ## sway
    echo "${green} Syncing sway configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/sway/" \
        "${working_dir}/tohka-s3/sway/"

    ## waybar
    echo "${green} Syncing waybar configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/waybar/" \
        "${working_dir}/tohka-s3/waybar/"

    ## wireplumber
    echo "${green} Syncing wireplumber configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/wireplumber/" \
        "${working_dir}/tohka-s3/wireplumber/"

    ## zathura
    echo "${green} Syncing zathura configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/zathura/" \
        "${working_dir}/tohka-s3/zathura/"

    ## zsh
    echo "${green} Syncing zsh configuration files...${nc}"
    rsync -qru --delete \
        "${XDG_CONFIG_HOME}/zsh/" \
        "${working_dir}/tohka-s3/zsh/"

    # Files
    
    ## user-dirs.dirs
    echo "${green} Syncing user-dirs.dirs configuration file...${nc}"
    rsync -qu \
        "${XDG_CONFIG_HOME}/user-dirs.dirs" \
        "${working_dir}/tohka-s3/"
}

case ${1} in
    cli)
        cli
    ;;

    tohka-s3)
        tohka_s3
    ;;

    *)
        echo "Invalid option: \"${1}\""
        echo "Correct Usuage: ${0} [USER]"
        echo "Available users: cli, tohka-s3"
    ;;
esac

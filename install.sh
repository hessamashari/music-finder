#!/bin/bash

# Muic_Finder installer

	# This file is part of Muic_finder.
	#
	# Muic_finder is free software: you can redistribute it and/or modify
	# it under the terms of the GNU General Public License as published by
	# the Free Software Foundation, either version 3 of the License, or
	# (at your option) any later version.
	#
	# Muic_finder is distributed in the hope that it will be useful,
	# but WITHOUT ANY WARRANTY; without even the implied warranty of
	# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	# GNU General Public License for more details.

clear

normal="$(printf '\033[0m')"          # Text mode
# Colors
red="$(printf '\033[0;31m')"  		  # red
green="$(printf '\033[0;32m')"        # green
orange="$(printf '\033[0;33m')"       # orange
blue="$(printf '\033[0;34m')"         # blue
white="$(printf '\033[0;37m')"        # white

echo -e "\n"
echo "+-------------------------------------------------------------------------------------+"
echo "|          Music finder and music player powered by Mplayer and find command          |"
echo "|          Author: Hessam Ashari                                                      |"
echo "|          Git repository: https://github.com/hessamashari/music-finder               |"
echo "|          Platform: GNU/Linux                                                        |"
echo "|			 LICENSE: GNU GPLv3									    					|"
echo "|          Version: 1.2                                                               |"
echo "+-------------------------------------------------------------------------------------+"
echo -e "\n"

# ----------\Install dependencies\---------
checkDistro="0"
# Checking if the distro is DebianBase / ArchBase / RedHatBase / SuseBase and running the correct command

echo -e "${green} Enter your password for install dependencies\n${normal}"
if pacman -Q &> /dev/null; then # Check Arch
	sudo pacman -S mplayer git --needed
	# Check user's entered password
	if [[ !("$?" == "0") ]]; then
		checkDistro="1"
	fi
elif apt list --installed &> /dev/null; then # Check Debian
	sudo apt install mplayer git
	# Check user's entered password
	if [[ !("$?" == "0") ]]; then
		checkDistro="1"
	fi
elif dnf list &> /dev/null; then # Check Fedora
	sudo dnf install mplayer git
	# Check user's entered password
	if [[ !("$?" == "0") ]]; then
		checkDistro="1"
	fi
elif zypper search i+ &> /dev/null; then # Check openSUSE
	sudo zypper install mplayer git
	# Check user's entered password
	if [[ !("$?" == "0") ]]; then
		checkDistro="1"
	fi
else
	echo -e "${red}Your distro is neither ArchBase or DebianBase or RedHatBase or SuseBase So,
	 The script is not going to work in your distro and you have install it manually. for more information read README.md${normal}"
	checkDistro="1"
fi

# ----------\Adding Music-finder Command\----------
if [ "$checkDistro" == "0" ]; then
    sudo cp music-finder /usr/bin/music-finder
    sudo chmod 755 /usr/bin/music-finder
	if [[ "$?" == "0" ]]; then
		echo -e "\n ${green}music-finder succesfully installed ${normal}"
		echo -e "\n Use: ${orange}music-finder --help${normal} for other information"
	else
		echo -e "\n ${red}music-finder doesn't install succesfully ${normal}"
		exit 1
	fi
else
	echo -e "\n ${red}music-finder doesn't install succesfully ${normal}"
	exit 1
fi

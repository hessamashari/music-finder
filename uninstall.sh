#!/bin/bash

clear

GRE='\033[92m' # Green Light
RD='\033[91m' # Red Light

read -p "Are you sure to uninstall music-finder??!! [y/N] " delete

# ----------\Uninstall music-finder\----------
if [[ "$delete" == "y" || "$delete" == "Y" ]]; then
	del_dependes=0
	#Checking if the distro is debianbase / archbase / redhatbase/ openSUSEbase and running the correct command
	codename="lsb_release -c | awk {'print $2'}"
	architecture="dpkg --print-architecture"
	if pacman -Q &> /dev/null; then # Check Arch
		sudo pacman -Rs mplayer
	elif [[ "$codename" == "bionic" ]] && [[ "$architecture" == "armhf" ]]; then # Check Ubuntu Server and raspberry
		sudo apt remove mplayer
	elif apt list --installed &> /dev/null; then # Check Debian
		sudo apt remove mplayer
	elif dnf list &> /dev/null; then # Check Fedora
		sudo dnf remove mplayer
	elif zypper search i+ &> /dev/null; then # Check openSUSE
		sudo zypper remove mplayer
	else
		echo -e "${RD}Your distro is neither archbase nor debianbase nor redhatbase nor susebase So, The script is not going to work in your distro and you have uninstall the dependensies manually. for more information read README.md"
		del_dependes="1"
	fi

	sudo rm -f /usr/bin/music-finder
	# ----------\Removing Music-finder Command\----------
	if [[ "$del_dependes" == "0" ]]; then
	# bug : if user doesnt enter password script print music-finder succesfully uninstalled
	    echo -e "\n ${RD}music-finder succesfully uninstalled :( "
	else
		exit 1
	fi
elif [[ "$delete" == "" || "$delete" == "n" || "$delete" == "N" ]]; then
	echo -e "\n ${GRE}music-finder is still installed :) "
	exit 0
else
	echo -e "${RD}Invalid argument!"
	exit 1
fi

#!/bin/bash

clear

GRE='\033[92m' # Green Light
RD='\033[91m' # Red Light

# ==========\Main\==========
check_distro=0
#Checking if the distro is debianbase / archbase / redhatbase/ openSUSEbase and running the correct command
codename="lsb_release -c | awk {'print $2'}"
architecture="dpkg --print-architecture"
if pacman -Q &> /dev/null; then # Check Arch
	sudo pacman -S mplayer
elif [[ "$codename" == "bionic" ]] && [[ "$architecture" == "armhf" ]]; then # Check Ubuntu Server and raspberry
	sudo apt install mplayer
elif apt list --installed &> /dev/null; then # Check Debian
	sudo apt install mplayer
elif dnf list &> /dev/null; then # Check Fedora
	sudo dnf install mplayer
elif zypper search i+ &> /dev/null; then # Check openSUSE
	sudo zypper install mplayer
else
	echo -e "${RD}Your distro is neither archbase nor debianbase nor redhatbase nor susebase So, The script is not going to work in your distro and you have install it manually. for more information read README.md"
	check_distro="1"
fi

# ==========\Adding Music-finder Command\==========
if [[ "$check_distro" == "0" ]]; then
    sudo cp music-finder /usr/bin/music-finder 
    sudo chmod 755 /usr/bin/music-finder
# bug : if user doesnt enter password script print music-finder succesfully installed
    echo -e "\n ${GRE}music-finder succesfully installed "
else
	exit 1
fi

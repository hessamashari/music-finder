#!/bin/bash

clear

GRE='\033[92m' # Green Light
RD='\033[91m' # Red Light
LW='\033[97m' # White Light
BLW='\033[1m' # Bold White Light
NC='\033[0m' # White

# ----------\Main\---------
check_distro=0
#Checking if the distro is debianbase / archbase / redhatbase/ openSUSEbase and running the correct command
codename="lsb_release -c | awk {'print $2'}"
architecture="dpkg --print-architecture"

echo -e "${GRE} Enter your password for install dependensies\n${NC}"
if pacman -Q &> /dev/null; then # Check Arch
	sudo pacman -S mplayer
	# Check user's entered password
	if [[ "$?" == "1" ]]; then
		check_distro="1"
	fi
elif [[ "$codename" == "bionic" ]] && [[ "$architecture" == "armhf" ]]; then # Check Ubuntu Server
	sudo apt install mplayer
	# Check user's entered password
	if [[ "$?" == "1" ]]; then
		check_distro="1"
	fi
elif apt list --installed &> /dev/null; then # Check Debian
	sudo apt install mplayer
	# Check user's entered password
	if [[ "$?" == "1" ]]; then
		check_distro="1"
	fi
elif dnf list &> /dev/null; then # Check Fedora
	sudo dnf install mplayer
	# Check user's entered password
	if [[ "$?" == "1" ]]; then
		check_distro="1"
	fi
elif zypper search i+ &> /dev/null; then # Check openSUSE
	sudo zypper install mplayer
	# Check user's entered password
	if [[ "$?" == "1" ]]; then
		check_distro="1"
	fi
else
	echo -e "${RD}Your distro is neither archbase nor debianbase nor redhatbase nor susebase So, The script is not going to work in your distro and you have install it manually. for more information read README.md${NC}"
	check_distro="1"
fi

# ----------\Adding Music-finder Command\----------
if [ "$check_distro" == "0" ]; then
    sudo cp music-finder /usr/bin/music-finder 
    sudo chmod 755 /usr/bin/music-finder
    echo -e "\n ${GRE}music-finder succesfully installed ${NC}"
else
	echo -e "\n ${RD}music-finder doesn't install succesfully ${NC}"
	exit 1
fi

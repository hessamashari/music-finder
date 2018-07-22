#!/bin/bash

clear

GRE='\033[92m' # Green Light
RD='\033[91m' # Red Light

function update(){
if [ -d "$HOME/.config/Music_Finder/" ];then
    cd $HOME/.config/Music_Finder/
    git pull
    sleep 2
    sudo cp music-finder /usr/bin/music-finder
    sudo chmod 755 /usr/bin/music-finder
else
    echo -e " ${RD}Config Error ! "
    exit 1
fi
}

case $1 in
update)
update
exit;;
esac
exit 0
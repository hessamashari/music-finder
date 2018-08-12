# Hi. This script can

- Search musics
- Search directories
- Play musics witch you have find with MPlayer

## Installation

### Automatically

```sh
$ git clone https://github.com/hessamashari/music-finder.git
$ cd music-finder
$ chmod +x install.sh
$ ./install.sh
```

### Manually

#### Install dependencies

*In __Debian__ base distributions (like Ubuntu) try :*

```sh
$ sudo apt install mplayer
```

*In __RedHat__ base distributions (like Fedora) try :*

```sh
$ sudo dnf install mplayer
```

*In __Arch__ base distributions (like Manjaro) try :*

```sh
$ sudo pacman -S mplayer
```

#### Install script

```sh
$ git clone https://github.com/hessamashari/music-finder.git
$ cd music-finder
$ chmod +x music-finder
$ sudo cp music-finder /usr/bin/music-finder
```

## Usage

```sh
$ music-finder
```

## Update

```sh
$ music-finder --update
```

## Uninstall

```sh
$ music-finder --uninstall
```

## Help

```sh
$ music-player --help
```

Exit the program with Ctrl+C :)  
Tnx!

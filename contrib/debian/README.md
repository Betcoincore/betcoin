
Debian
====================
This directory contains files used to package betd/bet-qt
for Debian-based Linux systems. If you compile betd/bet-qt yourself, there are some useful files here.

## bet: URI support ##


bet-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bet-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bet-qt binary to `/usr/bin`
and the `../../share/pixmaps/bet128.png` to `/usr/share/pixmaps`

bet-qt.protocol (KDE)


#!/bin/sh

xmenu <<EOF | sh &
Accessories
	Leafpad	leafpad 
	Neovim (Text Editor)	xterm -e nvim 
	nitrogen (Wallpaper Setter)	nitrogen
Development
	Icon Browser	gtk4-icon-browser
Internet
	Firefox Web Browser (Web Browser)	firefox 
	WeeChat (Chat client)	xterm -e weechat 
Others
	XScreenSaver	xscreensaver
Settings
	Advanced Network Configuration	nm-connection-editor
	Customize Look and Feel (Customize Look and Feel)	lxappearance
	Desktop Preferences	pcmanfm --desktop-pref
	XScreenSaver Settings	xscreensaver-settings
System
	File Manager PCManFM (File Manager)	pcmanfm 
	Htop (Process Viewer)	xterm -e htop
	lf	xterm -e lf
	UXTerm	uxterm
	XTerm	xterm

Shutdown		poweroff
Reboot			reboot
EOF

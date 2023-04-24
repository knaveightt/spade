#!/usr/bin/env bash

# deploy-spade.sh, part of the SPADE environment, is used to deploy a new
# configured instance of my DWM environment on a new workstation.

## Global Variables
package_command="sudo xbps-install -S"
dwm_dependencies="libX11-devel libXft-devel libXinerama-devel"
program_dependencies="nitrogen xmenu"



echo "Welcome to the SPADE deployment script."

# check if some pre-dependencies are already installed
echo "Do you have the terminal emulater *st* already installed (y|n)"
read predeps

if [[ $predeps == "n" ]] || [[ $predeps == "N" ]]
then
    echo "Please install st before continuing."
    exit 1
fi

echo "Do you have the launcher *dmenu* already installed (y|n)"
read predeps

if [[ $predeps == "n" ]] || [[ $predeps == "N" ]]
then
    echo "Please install dmenu before continuing."
    exit 1
fi

echo "Do you have a text editor (preferably my config of emacs) installed (y|n)"
read predeps

if [[ $predeps == "n" ]] || [[ $predeps == "N" ]]
then
    echo "Please install an editor before continuing."
    exit 1
fi

## Let's build and install the DWM window manager
echo "Attempting to build DWM..."
eval "$package_command $dwm_dependencies"
echo "Dependencies Installed, moving to build DWM..."
cd dwm
sudo make clean install
cd ../
echo "DWM Build Complete!"

## Let's download all the program dependencies
echo "Attempting to download program dependencies..."
eval "$package_command $program_dependencies"
echo "Program dependencies Installed!"

## Let's move all the configuration files to their rightful places
echo "Attempting to apply configuration files and scripts..."
# autostarts
mkdir -p "$HOME/.local/share/dwm/"
cp "config/autostart/autostart.sh" "$HOME/.local/share/dwm/"
chmod 755 "$HOME/.local/share/dwm/autostart.sh"
# scripts
mkdir -p "$HOME/.local/bin/"
cp "scripts/xmenu/spade-xmenu.sh" "$HOME/.local/bin/"
cp "dwm/layoutmenu.sh" "$HOME/.local/bin/"
echo "Configuration files and scripts applied!"

echo "SPADE Environment deployment Complete!"

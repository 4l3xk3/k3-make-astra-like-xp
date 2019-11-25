#!/bin/bash

# Magic script to make Astra looks like windows XP.
# Tested on AstraLinux Smolensk 1.6 and Orel 2.12
# ========================================================================
# Usage: Login as target user and run: sh ./k3_make_astra_like_xp.sh
# user must have sudo permissions
# You can put yours files here: 
# wallpaper - $HOME/xp/xpwall.jpg
# button - $HOME/xp/xpbutt.png
# to turn back changes: 
# reset setiings in fly-admin-theme 
# and reinstall fly-data packet(sudo apt-get install --reinstall fly-data)
# ========================================================================
# Author: Alexey Kovin <4l3xk3@gmail.com>
#         Alexey Kovin <akovin@astralinux.ru>
# All rights reserved
# Russia, Electrostal, 2019

sudo cp -f /etc/astra_version /tmp
if [ ! -f /tmp/astra_version ]; then
    echo "Usage: Login as target user and run ./k3_make_astra_like_xp.sh"
    echo "user must have sudo permissions"
    exit 1
fi

sed -i 's/.*UseComposite=.*/UseComposite=true/g' $HOME/.fly/theme/*.themerc*
sed -i 's/.*FullOpaque=.*/FullOpaque=true/g' $HOME/.fly/theme/*.themerc*
sed -i 's|.*IconTheme=fly-astra.*|IconTheme=fly-astra|g' $HOME/.fly/theme/*.themerc*
sed -i 's|.*PrimaryColor=.*|PrimaryColor=#4455dd|g' $HOME/.fly/paletterc
sed -i 's|.*ColorScheme=.*|ColorScheme=fly-user|g' $HOME/.fly/paletterc
sed -i 's|.*UsePager.*|UsePager=false|g' $HOME/.fly/theme/*.themerc*
sed -i 's|.*NoStartButtonTitle.*|NoStartButtonTitle=false|g' $HOME/.fly/theme/*.themerc*
sed -i 's|.*WallPaperPos.*|WallPaperPos=Stretch|g' $HOME/.fly/theme/*.themerc*


if [ ! -d $HOME/xp ]; then
    mkdir -p $HOME/xp
fi
if [ ! -f $HOME/xp/xpwall.jpg ]; then
    wget --no-check-certificate https://my-files.ru/Get/x87ih6/xpwall.jpg -O $HOME/xp/xpwall.jpg
fi
if [ ! -f $HOME/xp/xpbutt.png ]; then
    wget --no-check-certificate https://my-files.ru/Get/eo1wyz/xpbutt.png -O $HOME/xp/xpbutt.png
fi
for siz in 8x8 16x16 22x22 32x32 48x48 64x64 128x128 192x192 256x256; do
    echo $siz
    sudo cp -f $HOME/xp/xpbutt.png /usr/share/icons/hicolor/${siz}/emblems/astra.png
    sudo cp -f $HOME/xp/xpbutt.png /usr/share/icons/fly-astra-flat/${siz}/emblems/astra.png
    sudo cp -f $HOME/xp/xpbutt.png /usr/share/icons/fly-astra-flat-white/${siz}/emblems/astra.png
    sudo cp -f $HOME/xp/xpbutt.png /usr/share/icons/fly-astra-flat-black/${siz}/emblems/astra.png
done

sed -i 's|.*WallPaper=.*|WallPaper=\"'"$HOME"'/xp/xpwall.jpg\"|g' $HOME/.fly/theme/*.themerc*

sed -i 's|.*enable-transparency.*|enable-transparency = true;|g' $HOME/.config/compton.conf
sed -i 's|.*shadow =.*|shadow = true;|g' $HOME/.config/compton.conf

fly-wmfunc FLYWM_RESTART

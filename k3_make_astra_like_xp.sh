#!/bin/bash

# Makes Astra look like windows XP
# for Smolensk 1.6 and Orel 2.12
# ========================================================================
# Author: Alexey Kovin <4l3xk3@gmail.com>
# All rights reserved
# Russia, Electrostal, 2019

sed -i 's/.*UseComposite=.*/UseComposite=true/g' $HOME/.fly/theme/*.themerc*
#sed -i 's/.*FullOpaque=.*/UseComposite=true/g' $HOME/.fly/theme/*.themerc*
sed -i 's/.*FullOpaque=.*/UseComposite=false/g' $HOME/.fly/theme/*.themerc*
sed -i 's|.*IconTheme=fly-astra.*|IconTheme=fly-astra|g' $HOME/.fly/theme/*.themerc*
sed -i 's|.*PrimaryColor=.*|PrimaryColor=#5682a3|g' $HOME/.fly/paletterc
sed -i 's|.*UsePager.*|UsePager=false|g' $HOME/.fly/theme/*.themerc*

mkdir $HOME/xp
pushd $HOME/xp
wget https://hdqwalls.com/download/windows-xp-bliss-4k-lu-2048x1152.jpg
wget https://hdqwalls.com/download/windows-xp-bliss-4k-lu-1920x1080.jpg
wget https://cdn.lifehacker.ru/wp-content/uploads/2012/11/Windows-Vista-Start-Button.png
for siz in 8x8 16x16 22x22 32x32 48x48 64x64 128x128 192x192 256x256; do
    echo $siz
    sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/${siz}/emblems/astra.png
done
popd

#sed -i 's|.*WallPaper=.*|WallPaper=\"/home/alexk3/xp/windows-xp-bliss-4k-lu-1920x1080.jpg\"|g' $HOME/.fly/theme/*.themerc*
sed -i 's|.*WallPaper=.*|WallPaper=\"/home/alexk3/xp/windows-xp-bliss-4k-lu-2048x1152.jpg\"|g' $HOME/.fly/theme/*.themerc*

sed -i 's|.*enable-transparency.*|enable-transparency = true;|g' $HOME/.config/compton.conf
sed -i 's|.*shadow =.*|shadow = true;|g' $HOME/.config/compton.conf

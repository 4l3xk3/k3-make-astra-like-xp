#!/bin/bash

# Makes Astra look like windows XP
# for Smolensk 1.6 and Orel 2.12
# ========================================================================
# Author: Alexey Kovin <4l3xk3@gmail.com>
# All rights reserved
# Russia, Electrostal, 2019

sed -i 's/*UseComposite=.*/UseComposite=true/g' .fly/theme/*.themerc*
#sed -i 's/*FullOpaque=.*/UseComposite=true/g' .fly/theme/*.themerc*
sed -i 's/*FullOpaque=.*/UseComposite=false/g' .fly/theme/*.themerc*
sed -i 's|*IconTheme=fly-astra.*|IconTheme=fly-astra|g' .fly/theme/*.themerc*
sed -i 's|*PrimaryColor=.*|PrimaryColor=#5682a3|g' .fly/paletterc

mkdir $HOME/xp
pushd $HOME/xp
wget https://hdqwalls.com/download/windows-xp-bliss-4k-lu-2048x1152.jpg
wget https://hdqwalls.com/download/windows-xp-bliss-4k-lu-1920x1080.jpg
wget https://cdn.lifehacker.ru/wp-content/uploads/2012/11/Windows-Vista-Start-Button.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/8x8/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/16x16/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/22x22/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/32x32/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/48x48/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/64x64/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/128x128/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/192x192/emblems/astra.png
sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/256x256/emblems/astra.png
#sudo cp -f ./Windows-Vista-Start-Button.png /usr/share/icons/hicolor/{8x8,16x16,22x22,32x32,48x48,64x64,128x128,192x192,256x256}/emblems/astra.png
popd
#sed -i 's|.*WallPaper=.*|WallPaper=\"/home/alexk3/xp/windows-xp-bliss-4k-lu-1920x1080.jpg\"|g' .fly/theme/*.themerc*
sed -i 's|.*WallPaper=.*|WallPaper=\"/home/alexk3/xp/windows-xp-bliss-4k-lu-2048x1152.jpg\"|g' .fly/theme/*.themerc*

sed -i 's|.*enable-transparency.*|enable-transparency = true;|g' .config/compton.conf
sed -i 's|.*shadow =.*|shadow = true;|g' .config/compton.conf

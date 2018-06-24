#!/bin/bash
PACKAGE_FOLDER=$1
BRANCH=$2
LIBRARY_NAME="snes9x_libretro_switch.a"
NRO_NAME="snes9x.nro"
APP_TITLE="SNES9X libnx"

mkdir $PACKAGE_FOLDER
cp assets/overlay.cfg $PACKAGE_FOLDER/overlay.cfg
cp assets/overlay.png $PACKAGE_FOLDER/overlay.png
cd libretro/
make platform=switch -j10
cd ../
git clone -b $BRANCH https://git.m4xw.net/Switch/RetroArch/RetroArch.git --depth=1
cp libretro/$LIBRARY_NAME RetroArch/libretro_switch.a
cp assets/icon.jpg RetroArch/icon.jpg
cd RetroArch/
mkdir romfs
APP_TITLE="$APP_TITLE" make -f Makefile.switch -j10
cp retroarch_switch.nro ../$PACKAGE_FOLDER/$NRO_NAME

#!/bin/bash

## Custom Linux Android Build Environment Setup Launcher
## Copyright: 2020 A-Team Digital Solutions

echo " Custom Linux Android Build Environment Setup Launcher"
echo " Made By: PizzaG"
echo " Version: 0.13"
echo " Version Date:10-6-2020"

echo " Loading Setup Launcher..."
sleep 5

## Create & Setup Directories
echo " Create & Setup Directories"
mkdir -p ~/Android
mkdir -p ~/Android/Build_Env_Setup
mkdir -p ~/Android/Roms
mkdir -p ~/Android/Kernels
mkdir -p ~/Android/Recoveries

## Install & Setup Device Tree Generator
echo " Install & Setup Device Tree Generator"
cd ~/Android/Recoveries
git clone https://github.com/SebaUbuntu/TWRP-device-tree-generator
mv ~/Android/Recoveries/TWRP-device-tree-generator ~/Android/Recoveries/Device-Tree-Generator

## SuperR Rom Kitchen Installer & Setup
echo " Install & Setup SuperR Rom Kitchen"
cd ~/Android
git clone https://github.com/PizzaG/SuperR-RomKitchen.git
cd ~/Android/SuperR-RomKitchen
7z x SuperR_RomKitchen.7z.001
rm -rf SuperR_RomKitchen.7z.001
rm -rf SuperR_RomKitchen.7z.002
mv ~/Android/SuperR-RomKitchen ~/Android/SuperR_RomKitchen
cd ~/Android/SuperR_RomKitchen
mv ~/Android/SuperR_RomKitchen/SuperR_Launcher.sh ~/Desktop/SuperR_Launcher.sh

## Install apt Packages & Symlink Python
echo " Install apt Packages & Symlink Python"
sudo apt install git
sudo apt install android-tools-adb android-tools-fastboot
sudo apt install cpio
sudo apt install git aria2 -y
sudo apt install python2
sudo apt install python3
sudo ln /usr/bin/python3 /usr/bin/python

## Install Remaining Depends & Extras
echo " Install Remaining Depends & Extras"
cd ~/Android/Build_Env_Setup
git clone https://github.com/PizzaG/Build-Env-Setup-Scripts
cd Build-Env-Setup-Scripts
bash setup/android_build_env.sh
bash setup/install_android_sdk.sh
bash setup/ccache.sh
bash setup/git.sh
bash setup/deb-setup.sh
bash setup/make.sh

## Cleanup
echo " Taking Out The Trash & Tidying Up"
rm -rf ~/Android/Build_Env_Setup
rm -rf ~/Android/Sdk

echo "" Installation Script All Done, Enjoy""

read


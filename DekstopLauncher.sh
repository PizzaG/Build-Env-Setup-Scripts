#!/bin/bash

## Custom Linux Android Build Environment Setup Launcher
## Copyright: 2020 A-Team Digital Solutions

echo " Custom Linux Android Build Environment Setup Launcher"
echo " Made By: PizzaG"
echo " Version: 0.15"
echo " Version Date:10-8-2020"

echo " Loading Setup Launcher..."
sleep 5

## **BugFix
echo " Remove Directories For Fresh Install"
sudo rm -rf ~/Android/Recoveries/TWRP-device-tree-generator
sudo rm -rf ~/Android/Recoveries/Device-Tree-Generator
sudo rm -rf ~/Android/SuperR-RomKitchen
sudo rm -rf ~/Android/SuperR_RomKitchen

## Create & Setup Directories
echo " Create & Setup Directories"
mkdir -p ~/Android
mkdir -p ~/Android/Build_Env_Setup
mkdir -p ~/Android/Roms
mkdir -p ~/Android/Kernels
mkdir -p ~/Android/Recoveries
mkdir -p ~/Android/Recoveries/Device-Tree-Generator

## Install & Setup Device Tree Generator
echo " Install & Setup Device Tree Generator"
cd ~/Android/Recoveries
sudo git clone https://github.com/PizzaG/Device-Tree-Generator
cd ~/Android/Recoveries/Device-Tree-Generator
sudo 7z x Device-Tree-Generator.7z
sudo rm -rf Device-Tree-Generator.7z
cd ~/Android/Recoveries
sudo chmod -R ugo+rwx Device-Tree-Generator
cd ~/Android/Recoveries/Device-Tree-Generator
sudo mv ~/Android/Recoveries/Device-Tree-Generator/DeviceTreeGenerator_Launcher.sh ~/Desktop/DeviceTreeGenerator_Launcher.sh

## SuperR Rom Kitchen Installer & Setup
echo " Install & Setup SuperR Rom Kitchen"
cd ~/Android
git clone https://github.com/PizzaG/SuperR-RomKitchen.git
cd ~/Android/SuperR-RomKitchen
7z x SuperR_RomKitchen.7z.001
sudo rm -rf SuperR_RomKitchen.7z.001
sudo rm -rf SuperR_RomKitchen.7z.002
sudo mv ~/Android/SuperR-RomKitchen ~/Android/SuperR_RomKitchen
cd ~/Android/SuperR_RomKitchen
sudo mv ~/Android/SuperR_RomKitchen/SuperR_Launcher.sh ~/Desktop/SuperR_Launcher.sh

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
sudo git clone https://github.com/PizzaG/Build-Env-Setup-Scripts
cd Build-Env-Setup-Scripts
bash setup/android_build_env.sh
bash setup/install_android_sdk.sh
bash setup/ccache.sh
bash setup/git.sh
bash setup/deb-setup.sh
bash setup/make.sh

## Cleanup
echo " Taking Out The Trash & Tidying Up"
sudo rm -rf ~/Android/Build_Env_Setup
sudo rm -rf ~/Android/Sdk

echo "" Installation Script All Done, Enjoy""

read

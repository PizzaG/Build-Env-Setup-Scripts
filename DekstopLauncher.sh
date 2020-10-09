#!/bin/bash

## Custom Linux Android Build Environment Setup Launcher
## Copyright: 2020 A-Team Digital Solutions

echo " __________________________________________________"
echo " |Linux Android Build Environment Setup Launcher   |"
echo " |Made By: PizzaG                                  |"
echo " |Version: 0.16                                    |"
echo " |Version Date:10-9-2020                           |"
echo " |_________________________________________________|"
echo " "

echo " "
echo " Loading Setup Launcher..."
echo " "
sleep 5

## **BugFix
echo " "
echo " Remove Directories For Fresh Install"
echo " "
sudo rm -rf ~/Android/Recoveries/TWRP-device-tree-generator
sudo rm -rf ~/Android/Recoveries/Device-Tree-Generator
sudo rm -rf ~/Android/SuperR-RomKitchen
sudo rm -rf ~/Android/SuperR_RomKitchen

## Create & Setup Directories
echo " "
echo " Create & Setup Directories"
echo " "
mkdir -p ~/Android
mkdir -p ~/Android/Build_Env_Setup
mkdir -p ~/Android/Roms
mkdir -p ~/Android/Kernels
mkdir -p ~/Android/Recoveries
mkdir -p ~/Android/Recoveries/Device-Tree-Generator

## Install & Setup Device Tree Generator
echo " "
echo " Install & Setup Device Tree Generator"
echo " "
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
echo " "
echo " Install & Setup SuperR Rom Kitchen"
echo " "
cd ~/Android
git clone https://github.com/PizzaG/SuperR-RomKitchen.git
cd ~/Android/SuperR-RomKitchen
7z x SuperR_RomKitchen.7z.001
sudo rm -rf SuperR_RomKitchen.7z.001
sudo rm -rf SuperR_RomKitchen.7z.002
sudo mv ~/Android/SuperR-RomKitchen ~/Android/SuperR_RomKitchen
cd ~/Android/SuperR_RomKitchen
sudo mv ~/Android/SuperR_RomKitchen/SuperR_Launcher.sh ~/Desktop/SuperR_Launcher.sh

## Install apt Packages
echo " "
echo " Install apt Packages"
echo " "
sudo apt install git
sudo apt install android-tools-adb android-tools-fastboot
sudo apt install cpio
sudo apt install git aria2 -y
sudo apt install python2
sudo apt install python3
sudo apt-get install openjdk-8-jdk

## Install Remaining Depends & Extras
echo " "
echo " Install Remaining Depends & Extras"
echo " "
cd ~/Android/Build_Env_Setup
sudo git clone https://github.com/PizzaG/Build-Env-Setup-Scripts
cd Build-Env-Setup-Scripts
bash setup/android_build_env.sh
bash setup/install_android_sdk.sh
bash setup/ccache.sh
bash setup/git.sh
bash setup/deb-setup.sh
bash setup/make.sh
cd Build-Env-Setup-Scripts/setup
sudo mv ~/Android/Build_Env_Setup/Build-Env-Setup-Scripts/setup/ChangeJavaVersion.sh ~/Desktop/ChangeJavaVersion.sh
sudo mv ~/Android/Build_Env_Setup/Build-Env-Setup-Scripts/setup/ChangePythonVersion.sh ~/Desktop/ChangePythonVersion.sh

## Python Fixup
echo " "
echo " Fixing Up Python 2.7 & 3.8"
echo " "
sudo ln /usr/bin/python3 /usr/bin/python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2

## Cleanup
echo " "
echo " Taking Out The Trash & Tidying Up"
echo " "
sudo rm -rf ~/Android/Build_Env_Setup
sudo rm -rf ~/Android/Sdk

echo " "
echo "" Installation Script All Done, Enjoy""
echo " "
echo " PRESS ENTER TO EXIT"
read

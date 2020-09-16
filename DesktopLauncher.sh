## Custom Linux Android Build Environment Setup Launcher
## Copyright: 2020 A-Team Digital Solutions

echo " Custom Linux Android Build Environment Setup Launcher"
echo " Made By: PizzaG"
echo " Version: 0.10"

echo " Loading Setup Launcher..."
sleep 5

sudo apt install git
sudo apt install android-tools-adb android-tools-fastboot
sudo apt install cpio
mkdir -p ~/Android
mkdir -p ~/Android/Build_Env_Setup
mkdir -p ~/Android/Recoveries
cd ~/Android/Recoveries
git clone https://github.com/SebaUbuntu/TWRP-device-tree-generator
mv ~/Android/Recoveries/TWRP-device-tree-generator ~/Android/Recoveries/Device-Tree-Generator
mkdir -p ~/Android/Roms
mkdir -p ~/Android/Kernels
sudo apt install git aria2 -y
#sudo apt install python2
#sudo apt install python3
sudo ln /usr/bin/python3 /usr/bin/python
cd ~/Android/Build_Env_Setup
git clone https://github.com/PizzaG/Build-Env-Setup-Scripts
cd Build-Env-Setup-Scripts

bash setup/android_build_env.sh
bash setup/install_android_sdk.sh
bash setup/ccache.sh
bash setup/git.sh
bash setup/deb-setup.sh
bash setup/make.sh

rm -rf ~/Android/Build_Env_Setup
rm -rf ~/Android/Sdk

echo "" Installation Script All Done, Enjoy""

read


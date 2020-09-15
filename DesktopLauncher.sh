## Custom Linux Android Build Environment Setup Launcher
## Copyright: 2020 A-Team Digital Solutions

echo " Custom Linux Android Build Environment Setup Launcher"
echo " Made By: PizzaG"
echo " Version: 0.08"

echo " Loading Setup Launcher..."
sleep 5

mkdir -p ~/Android
mkdir -p ~/Android/Build_Env_Setup
mkdir -p ~/Android/Recoveries
mkdir -p ~/Android/Roms
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

pause


mkdir -p ~/Build_Env_Setup
mkdir -p ~/Recoveries
mkdir -p ~/Roms
cd ~/Build_Env_Setup
git clone https://github.com/PizzaG/Build-Env-Setup-Scripts
cd Build-Env-Setup-Scripts

bash setup/android_build_env.sh
bash setup/install_android_sdk.sh

bash setup/ccache.sh
bash setup/git.sh
bash setup/deb-setup.sh
bash setup/make.sh
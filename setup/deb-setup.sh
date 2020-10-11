#!/usr/bin/env bash

source ~/Build-Env-Setup-Scripts/setup/hub.sh
printf '\n' | tee -a ~/.bashrc
echo "source ~/scripts/functions" >> ~/.bashrc
echo "onLogin" >> ~/.bashrc
sudo apt install figlet fortune byobu mosh -y

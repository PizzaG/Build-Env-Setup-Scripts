#!/usr/bin/env bash

source ~/Build-Env-Setup-Scripts/setup/hub.sh
git config --global user.name "PizzaG"
git config --global user.email "pizzag98@gmail.com"
git config --global credential.helper "cache --timeout=7200"
printf '\n' | tee -a ~/.bashrc
echo "source ~/scripts/functions" >> ~/.bashrc
echo "onLogin" >> ~/.bashrc
sudo apt install figlet fortune byobu mosh -y
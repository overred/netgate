#!/bin/bash

echo "Подготовка окружения ноды ..."

apt -y update
apt -y upgrade

echo "Установка базового ПО ..."
apt -y install htop
apt -y install neofetch
apt -y git

echo "Установка сетевых инструментов ..."
apt -y install net-tools

echo "Установка snap пакетов ..."
snap install docker

echo "Установка zsh ..."
apt -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

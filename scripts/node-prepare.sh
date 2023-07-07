#!/bin/bash

# sh -c $(curl -fsSL https://raw.githubusercontent.com/overred/netgate/main/scripts/node-prepare.sh)

echo "Обновление зависимостей ..."
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

echo "Оптимизация сервера ..."
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sysctl vm.swappiness=10
printf "vm.swappiness=10\n" >> /etc/sysctl.conf
sysctl vm.vfs_cache_pressure=50
printf "vm.vfs_cache_pressure=50\n" >> /etc/sysctl.conf

echo "Всё готово!"
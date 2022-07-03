#!/bin/bash

sudo apt update -y

sudo apt upgrade -y

sudo ufw enable

sudo ufw allow ssh

sudo ufw allow 443

sudo ufw allow 80

sudo ufw allow 9000

sudo ufw allow 9443

mkdir ~/.config

mkdir ~/.ssh

ssh-keygen -t ed25519 -C "Ubuntu Server - $(whoami)"

eval "(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

echo SSH PUB

cat ~/.ssh/id_ed25519.pub



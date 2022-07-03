#!/bin/bash

echo "Adding Repos "

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
echo " "
echo " "
echo "Updating... "
sudo apt-get update -y
echo " "
echo " "
echo " "
echo "Done! Installing tools "
sudo apt install net-tools -y

sudo apt install neofetch -y

echo " "
echo "**DOCKER** "

curl -sSL https://get.docker.com | bash

sudo usermod -aG docker $(whoami)

sudo systemctl enable docker.service

sudo systemctl start docker.service
echo " "
sudo apt install golang-go -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

sudo nvm install node

sudo npm install -g @angular/cli

sudo apt-get install -y apt-transport-https ca-certificates curl

sudo apt-get install -y kubectl

sudo apt-get install -y gnupg software-properties-common

sudo apt-get install terraform vault

sudo apt-get install apt-transport-https --yes

sudo apt-get install helm
echo " "
echo " "
echo " "
echo "Versions "
echo " "
echo "Kubectl  "
kubectl version

echo " "
echo " Docker "
sudo docker version

echo " "
echo "Helm "
sudo helm version


echo " "
echo "Terraform "
terraform version


echo " "
echo "node -v "

echo " "
echo "Angular CLI "
ng version

echo " "
echo "Go "
go version

echo " "
neofetch

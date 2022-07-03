#!/bin/bash


#packages

sudo apt-get install wget gpg 

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list



wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ -y
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list


sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"


sudo apt-get update

sudo apt upgrade -y


#golang
sudo apt install golang-go -y 

sudo apt install -y neofetch

sudo apt-get install -y apt-transport-https ca-certificates curl

sudo apt install -y npm 
#Vscode
sudo apt install code -y

#neovim
sudo apt install neovim -y

#Docker
sudo apt install -y docker.io
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Using Ubuntu

sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install v18.4.0

nvm use v18.4.0

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

sudo curl -sSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

sudo apt-get install -y gnupg software-properties-common curl

wget https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip
sudo apt install unzip && unzip terraform_1.1.4_linux_amd64.zip
sudo mv terraform /usr/local/bin/

sudo apt install -y vault

sudo npm install -g npm@latest


sudo npm i -g @angular/cli 

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

sudo apt install ./google-chrome-stable_current_amd64.deb -y 

sudo rm -r google-chrome-stable_current_amd64.deb
sudo rm -r terraform_1.1.4_linux_amd64.zip 
sudo rm -r kubectl
sudo rm -r kubectl.sha256
sudo rm -r awscliv2.zip
sudo rm -r go1.15.2.linux-amd64.tar.gz
sudo rm -r aws





echo $(whoami)\'s packages are completed 

kubectl version --client
helm version 
ng version
node -v
npm -v 
terraform version 
vault version 
sudo docker version 
aws --version
go version
go env
neofetch 





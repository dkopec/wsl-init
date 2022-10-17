#!/bin/bash
#
# Script representing the manual init steps for setting up my dev instance.
#

# Add the ubunut repo sources to apt
sudo apt-add-repository http://archive.ubuntu.com/ubuntu/

# Update and Upgrade
sudo apt update \
&& sudo apt upgrade -y

# Install github cli https://github.com/cli/cli/blob/trunk/docs/install_linux.md
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Auth to Github
# Maunal via web
gh auth login -w
#TODO: Make login pat based

# Install ansible
sudo apt install ansible ansible-lint -y

# Install unzip
sudo apt install unzip

# Install az-cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
# Authenticate az-cli
az login

# Install Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
&& echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
&& sudo apt update && sudo apt install terraform -y

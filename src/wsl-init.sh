#!/bin/bash
#
# Script representing the manual init steps for setting up my dev instance.
#

# Add the ubunut repo sources to apt
sudo apt-add-repository http://archive.ubuntu.com/ubuntu/

# Update and Upgrade
sudo apt update \
&& sudo apt upgrade

# Install github cli https://github.com/cli/cli/blob/trunk/docs/install_linux.md
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

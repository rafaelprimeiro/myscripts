#!/bin/bash
set -e

if [[ $1 == 'osx' ]]; then
    echo "Install on Mac"
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
    echo "Install Ansible"
    brew install ansible
else
    echo "Install on Ubuntu"
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform
    echo "Install Ansible"
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt-get install ansible -y
fi
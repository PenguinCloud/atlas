#!/bin/bash
mkdir -p /root/.kube
mkdir -p /opt/atlas
mkdir -p /opt/baseline-ansible-setup

cd /opt/baseline-ansible-setup
FILE=/opt/baseline-ansible-setup/setup.sh
if test -f "$FILE"; then
    echo "$FILE exists, updating."
    git reset --hard
    git fetch
    git pull
else
    cd /opt
    git clone git@code.penguinzmedia.group:pmg-build-standards/baseline-ansible-setup.git
fi



cd /opt/baseline-ansible-setup
chmod +x ./setup.sh
./setup.sh


export KUBECONFIG=/root/.kube/config



cd /opt/atlas
cp -f /opt/atlas/configs/hosts.yaml /etc/ansible/hosts
cp -f /opt/atlas/configs/hosts /etc/hosts
if [ -z $1 ]; then
ansible-playbook  upstart.yaml
else
ansible-playbook  upstart.yaml --tags $1
fi


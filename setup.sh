#!/bin/bash
mkdir -p /root/.kube
mkdir -p /opt/atlas
cd /opt/atlas
git reset --hard
git pull
git clone git@code.penguinzmedia.group:pmg-build-standards/baseline-ansible-setup.git
cd /opt/atlas
cp -f configs/hosts.yaml /etc/ansible/hosts
cp -f configs/hosts /etc/hosts
cd /opt/baseline-ansible-setup
chmod +x ./setup.sh
./setup.sh


export KUBECONFIG=/root/.kube/config

cd /opt/atlas
cp -f configs/hosts.yaml /etc/ansible/hosts
cp -f configs/hosts /etc/hosts

cd /opt/atlas
if [ -z $1 ]; then 
ansible-playbook  upstart.yaml --connection=local --tags primary,control
else
ansible-playbook  upstart.yaml --connection=local --tags $1
fi

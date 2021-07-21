#!/bin/bash
cd /opt
git clone git@code.penguinzmedia.group:pmg-build-standards/baseline-ansible-setup.git
cd baseline-ansible-setup
chmod +x ./setup.sh
./setup.sh

mkdir -p /root/.kube
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

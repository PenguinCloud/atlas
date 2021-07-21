#!/bin/bash
mkdir -p /root/.kube
export KUBECONFIG=/root/.kube/config
echo "Printing your local ip info for the next prompt"
ip a
cd /opt
git clone git@code.penguinzmedia.group:pmg-build-standards/baseline-ansible-setup.git
cd baseline-ansible-setup
/opt/baseline-ansible-setup/setup.sh
cd /opt
if [ -z $1 ]; then 
ansible-playbook  upstart.yaml --connection=local --tags primary,control
else
ansible-playbook  upstart.yaml --connection=local --tags $1
fi

#!/bin/bash
apt install python3 python3-pip -y
pip3 install ansible openshift
mkdir -p /etc/ansible
FILE=/etc/ansible/hosts
if test -f "$FILE"; then
    echo "$FILE exists, skipping setup."
else
echo "[cluster]"  >> /etc/ansible/hosts
echo 'localhost ansible_connection=local ansible_python_interpreter="/usr/bin/env python3"'  >> /etc/ansible/hosts
fi
ansible-playbook  cluster.yaml --connection=local

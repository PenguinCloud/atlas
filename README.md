# Kubernetes Build Playbook
Builds a K8s or K3s cluster with one or many control and one or multiple worker nodes

## Tags
Tags help the script determine what mode to run
### Type of Node
* primary - the first control node
* control - control node
* worker - worker node
  
### Run Mode
* initial - when running k8s... skip this tag to re-configure a node which has already had k8s install
* kctl - install kubectl
* test - just run tests
* environ - Initial Environment Setup
### Type of Kubernetes
* k8s - Install K8s (production stack)
* k3s - Install k3s (development or resource constrained)

### Troubleshooting and re-run 


## License and Distribution
This playbook is owned entirely by Penguinz Media Group LLC and is not meant for distribution outside of contractual agreement.
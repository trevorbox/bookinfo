# Configs for the Service Mesh Control Plane in namespace **istio-system**
> mTLS enabled
## Install service mesh objects
1. login
```
oc login <mycluster>
```
2. update playbook with appropriate k8s_namespace variable
3. run playbook on cluster
```
ansible-playbook playbook.yml
```

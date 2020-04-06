# Install Service Mesh Operators and create the Control Plane


> mTLS enabled


## Run the Ansible playbook
1. login
```
oc login <mycluster>
```
2. update playbook with appropriate k8s_namespace variables.
> Note: there are two plays. The first play installs the Service Mesh operators to the **openshift-operators** project and the second applies the `Istio Service Mesh Control Plane` and `Istio Service Mesh Member Roll` to the **istio-system** project. It will also change the Subscription Approval Strategy to *Manual* after the *Automatic* creation is finished to avoid automatic updates to the operators in the future.
3. run playbook on cluster
```
ansible-playbook playbook.yml
```

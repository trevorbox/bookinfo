# Example Service Mesh App for 1.0.9

## Install bookinfo app & istio objects
1. login
```
oc login <mycluster>
```
2. update playbook with appropriate k8s_namespace variable
3. run playbook on cluster
```
ansible-playbook playbook.yml
```

## Test Canary Deployments
1. visit the <gateway_url>/productpage and refresh the page multiple times to generate requests
2. visit Kiali instance and view the graph with Requests percentage shown
3. edit the review VirtualService and change the weight values
4. repeat steps 1&2 to view percent changes

## Helpful docs
- [OCP 4.3 Service Mesh Example App](https://docs.openshift.com/container-platform/4.3/service_mesh/service_mesh_day_two/ossm-example-bookinfo.html)
- [Maistra mesh-wide mTLS](https://maistra.io/docs/examples/mesh-wide_mtls/)

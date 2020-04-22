# Example Service Mesh App for v1.1

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

## Using the ServiceMeshMember functionality to opt-into the Mesh

In this example, we will assume the following:
- The Control Plane called **mtls-install** was installed in the *istio-system* namespace
- We want to allow the user **tbox** to opt-in ANY new namespaces into the mesh
- User **tbox** has at least `edit` role on the namespace *bookinfo* (the namespace to add to the mesh)

Instructions:
1. After the mesh is created, a user with the `admin` role in the Control Plane *istio-system* would assign the `mesh-user` role to the developer **tbox**
```
oc policy add-role-to-user -n istio-system --role-namespace istio-system mesh-user tbox
```
2. User **tbox** can then create a ServiceMeshMember in the namespace *bookinfo*
```
oc apply -n bookinfo -f - <<EOF
apiVersion: maistra.io/v1
kind: ServiceMeshMember
metadata:
  name: default
spec:
  controlPlaneRef:
    namespace: istio-system
    name: mtls-install
EOF
```

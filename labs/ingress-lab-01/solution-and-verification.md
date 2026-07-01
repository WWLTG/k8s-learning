Solution and Verification

Solution

The Ingress backend port was changed from 8080 to 80.

Before the fix

The Ingress referenced:

ingress-demo-service:8080

The Service exposed:

port: 80

Because port 8080 did not exist on the Service, the Ingress could not resolve the backend correctly.

After the fix

The Ingress references:

ingress-demo-service:80

The backend now matches the Service port.

Changed file

manifests/ingress.yaml

Changed configuration

Before:

number: 8080

After:

number: 80

Apply command

kubectl apply -f manifests/ingress.yaml

Verification commands

kubectl get ingress ingress-demo -n ingress-lab

kubectl describe ingress ingress-demo -n ingress-lab

kubectl describe service ingress-demo-service -n ingress-lab

kubectl get endpointslice -n ingress-lab -l kubernetes.io/service-name=ingress-demo-service

kubectl get pods -n ingress-lab

Verification results

The Deployment had two ready Pods.

The Service exposed port 80.

The Service contained two healthy endpoints.

The EndpointSlice contained both Pod IP addresses on port 80.

The Ingress backend resolved successfully to:

ingress-demo-service:80

The Ingress displayed the backend Pod endpoints:

10.244.0.19:80
10.244.0.20:80

Final traffic path

Ingress

Host: ingress-lab.local

Path: /

Backend Service: ingress-demo-service

Backend Service port: 80

Service

Port: 80

Target port: http

Endpoints

10.244.0.19:80
10.244.0.20:80

Pods

Both Pods were Running and Ready.

Environment limitation

The local cluster did not contain an Ingress Controller or IngressClass.

The Ingress address therefore remained empty.

External HTTP routing was not tested in the current environment.

The final external routing test will be performed later on a server that has an active Ingress Controller.

Expected server-side test

curl -H 'Host: ingress-lab.local' http://INGRESS_ADDRESS/

Expected response

Welcome to nginx!

Final result

The Kubernetes manifests are configured correctly.

The Ingress backend port now matches the Service port.

The internal backend chain was verified successfully.

External routing remains dependent on an available Ingress Controller.


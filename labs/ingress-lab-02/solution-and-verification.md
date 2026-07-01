Solution and Verification

Solution

The Ingress host and path were corrected.

Before the fix

Host:

wrong-routing.local

Path:

/wrong

After the fix

Host:

routing-lab.local

Path:

/

Changed file

manifests/03-ingress.yaml

Changes applied

The host value was changed from:

wrong-routing.local

To:

routing-lab.local

The path value was changed from:

/wrong

To:

/

The backend Service configuration was not changed because it was already correct.

Apply command

kubectl apply -f manifests/03-ingress.yaml

Verification commands

kubectl get ingress routing-demo -n ingress-routing-lab

kubectl describe ingress routing-demo -n ingress-routing-lab

Verification results

The Ingress host was:

routing-lab.local

The Ingress path was:

/

The backend Service was:

routing-demo-service

The backend Service port was:

80

The Ingress resolved the backend to:

10.244.0.21:80

10.244.0.22:80

Healthy traffic path

Ingress

Host: routing-lab.local

Path: /

Service: routing-demo-service

Service port: 80

EndpointSlice

10.244.0.21:80

10.244.0.22:80

Pods

Both Pods were Running and Ready.

Environment limitation

The current local cluster does not have an active Ingress Controller.

The Ingress address remained empty.

External HTTP routing was not tested in this environment.

The external routing test will be completed later in the Ingress Controller lab.

Expected external test

curl -H 'Host: routing-lab.local' http://INGRESS_ADDRESS/

Expected response

Welcome to nginx!

Final result

The Ingress routing rules now match the required client request.

The Service backend and Pod endpoints were verified successfully.

The Kubernetes manifests are configured correctly.


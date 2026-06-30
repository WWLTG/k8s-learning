# Service Lab 02 - Investigation

# Symptoms

The api Pods were running and ready.

The ClusterIP Service existed on port 8080.

Requests to api-service:8080 failed with Connection refused.

The Service initially had no usable endpoints.

# Commands Used

kubectl get all -n service-lab-02

kubectl get pods -n service-lab-02 --show-labels

kubectl describe svc api-service -n service-lab-02

kubectl get endpointslices -n service-lab-02

kubectl run curl-test -n service-lab-02 --rm -it --restart=Never --image=curlimages/curl -- curl -v http://api-service:8080

grep -A5 containerPort deployment.yaml

# Observations

Both api Pods were Running and Ready.

The Pods had these labels:

app=api

tier=backend

The Service selector used:

app=api

tier=backends

The tier label did not match because the Service used backends while the Pods used backend.

The initial EndpointSlice showed no addresses and no port.

After correcting the selector, the EndpointSlice discovered both Pod IP addresses.

The Service still failed because targetPort used the named port web.

The Deployment exposed containerPort 80 without a matching named port called web.

The EndpointSlice therefore showed the Pod addresses but the port remained unset.

# Traffic Path Analysis

Client

api-service:8080

Service selector

EndpointSlice

Pod IP address

Container port 80

# Service

The Service type was ClusterIP.

The Service port was 8080.

The Service ClusterIP was reachable through Kubernetes DNS.

# Selector and Pod Labels

The initial Service selector was:

app=api

tier=backends

The Pod labels were:

app=api

tier=backend

The selector mismatch prevented the Service from selecting the Pods.

# Endpoints or EndpointSlice

Before the selector fix:

PORTS: unset

ENDPOINTS: unset

After the selector fix:

ENDPOINTS: 10.244.0.18,10.244.0.19

PORTS: unset

This proved that Pod discovery was fixed but port resolution was still broken.

# Service Port and Target Port

The Service port was 8080.

The initial targetPort was web.

The name web did not match a named container port in the Deployment.

# Container Listening Port

The nginx containers listened on port 80.

The Deployment exposed:

containerPort: 80

# Root Cause

The Service had two configuration errors.

The selector used tier=backends instead of tier=backend.

The targetPort used the unresolved named port web instead of container port 80.

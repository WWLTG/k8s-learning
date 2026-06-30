# Service Lab 02 - Solution and Verification

# Solution

The Service configuration was corrected in two stages.

The selector was changed from:

tier=backends

to:

tier=backend

The targetPort was changed from:

web

to:

80

# Changes Applied

The Service selector now matches the Pod labels.

The Service targetPort now points to the nginx container port.

The final Service traffic path is:

Client

api-service:8080

Service port 8080

targetPort 80

Pod IP address

nginx container port 80

# Verification Commands

kubectl apply -f manifests/service.yaml

kubectl describe svc api-service -n service-lab-02

kubectl get endpointslices -n service-lab-02

kubectl run curl-test -n service-lab-02 --rm -it --restart=Never --image=curlimages/curl -- curl -v http://api-service:8080

# Verification Results

The Service selected both api Pods.

The EndpointSlice showed both Pod IP addresses.

The EndpointSlice port was resolved to 80.

The final EndpointSlice result showed:

PORTS: 80

ENDPOINTS: 10.244.0.18,10.244.0.19

The curl request connected successfully to api-service on port 8080.

The response returned:

HTTP/1.1 200 OK

Server: nginx/1.27.5

The nginx welcome page was returned successfully.

# Final Traffic Path

Client Pod

api-service:8080

ClusterIP: 10.96.167.37

EndpointSlice

10.244.0.18:80

10.244.0.19:80

nginx containers

# Lessons Learned

A Running Pod does not guarantee that a Service can reach it.

The Service selector must match all selected Pod labels exactly.

A named targetPort must match a named container port.

An Endpoint Slice can contain Pod addresses while the port remains unset.

Connection refused after DNS resolution can indicate a Service targetPort problem.

The recommended troubleshooting order is:

Service

Selector

Pod labels

EndpointSlice

Service port

targetPort

Container listening port

Application response

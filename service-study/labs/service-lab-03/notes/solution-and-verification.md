# Service Lab 03 - Solution and Verification

# Solution

The client Service URL was changed from:

http://api-service:8080

to:

http://api-service.backend-namespace:8080

The namespace-qualified Service name allows the client Pod in client-namespace to reach the Service located in backend-namespace.

# Changes Applied

The API_URL environment variable in the client Deployment was updated.

The backend Deployment was not changed.

The backend Service selector was not changed.

The Service port and targetPort were not changed.

The EndpointSlice configuration was not changed.

# Verification Commands

kubectl apply -f labs/service-lab-03/manifests/04-client-deployment.yaml

kubectl rollout status deployment/client -n client-namespace

kubectl logs -n client-namespace deployment/client --tail=20

kubectl get svc api-service -n backend-namespace

kubectl get endpointslices -n backend-namespace

kubectl run curl-test -n client-namespace --rm -it --restart=Never --image=curlimages/curl -- curl -v http://api-service.backend-namespace:8080

# Verification Results

The client Deployment completed its rollout successfully.

The client stopped reporting:

Could not resolve host: api-service

The namespace-qualified Service name resolved to the ClusterIP.

The Service remained reachable on port 8080.

The EndpointSlice continued to show both backend Pod addresses on port 80.

The request returned:

HTTP/1.1 200 OK

Server: nginx/1.27.5

The nginx welcome page was returned successfully.

# Final Traffic Path

Client Pod in client-namespace

api-service.backend-namespace:8080

ClusterIP 10.96.28.154

EndpointSlice

Backend Pod IP addresses

Container port 80

nginx response

# Lessons Learned

A short Service name is normally resolved inside the namespace of the requesting Pod.

Cross-namespace communication requires the Service namespace in the DNS name.

A namespace-qualified Service name has this format:

service-name.namespace-name

A fully qualified Service name has this format:

service-name.namespace-name.svc.cluster.local

Healthy Pods and valid EndpointSlices do not guarantee that a client is using the correct DNS name.

The recommended troubleshooting order is:

Client logs

DNS resolution

Client namespace

Service namespace

ClusterIP

EndpointSlice

Backend Pod

Application response

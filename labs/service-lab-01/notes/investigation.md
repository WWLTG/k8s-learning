# Service Lab 01 - Investigation

# Symptoms

The web Pods were running and ready.

The web-service ClusterIP was created successfully.

The Service initially had no backend endpoints.

After repairing the Service selector, the Service name resolved correctly, but the connection was refused.

# Commands Used

kubectl get svc -n service-lab-01

kubectl get pods -n service-lab-01 --show-labels

kubectl describe svc web-service -n service-lab-01

kubectl get endpoints -n service-lab-01

kubectl get endpointslices.discovery.k8s.io -n service-lab-01

kubectl run curl-test \
  -n service-lab-01 \
  --rm -it \
  --restart=Never \
  --image=curlimages/curl \
  -- curl -v http://web-service

# Observations

Both Pods were in the Running state and reported 1/1 ready.

The Pods had the following labels:

app=web

tier=frontend

The Service selector was:

app=frontend

The Service selector did not match the Pod labels.

The initial Endpoints and EndpointSlice objects contained no backend addresses.

After changing the selector to app=web, Kubernetes discovered the backend Pod addresses.

The Service name resolved to the ClusterIP 10.96.82.166 on port 80.

The connection was refused after successful DNS resolution.

The Service used targetPort 8080, while the nginx container listened on port 80.

# Traffic Path Analysis

# Service

Service name: web-service

Service type: ClusterIP

Service port: 80/TCP

# Selector and Pod Labels

Initial Service selector:

selector:
  app: frontend

Pod labels:

app=web

tier=frontend

The selector value did not match the Pod label value.

# Endpoints or EndpointSlice

Before the selector repair, no backend addresses were registered.

After the selector repair, the EndpointSlice discovered the two web Pods.

# Service Port and Target Port

Initial port mapping:

Service port: 80

Target port: 8080

The Service accepted traffic on port 80 and attempted to forward it to port 8080 on the selected Pods.

# Container Listening Port

The nginx container listened on TCP port 80.

No application was listening on TCP port 8080 inside the Pods.

# Root Cause

The first root cause was a Service selector mismatch.

The Service selected app=frontend, but the Pods used app=web. This prevented Kubernetes from registering the Pods as Service backends.

The second root cause was an incorrect targetPort.

The Service forwarded traffic to port 8080, but nginx listened on port 80. After the selector was repaired, traffic reached the Pod addresses on the wrong port and the connection was refused.

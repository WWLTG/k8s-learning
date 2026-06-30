# Service Lab 01 - Solution and Verification

# Configuration Changes

The Service selector was changed to match the Pod labels.

selector:
  app: web

The Service target port was changed to match the nginx listening port.

ports:
  - name: http
    protocol: TCP
    port: 80
    targetPort: 80

# Apply the Repair

kubectl apply -f manifests/

# Verification Commands

kubectl get pods -n service-lab-01 --show-labels

kubectl describe svc web-service -n service-lab-01

kubectl get endpointslices.discovery.k8s.io -n service-lab-01

kubectl run curl-test \
  -n service-lab-01 \
  --rm -it \
  --restart=Never \
  --image=curlimages/curl \
  -- curl http://web-service

# Verification Results

The two web Pods remained running and ready.

The Service selector matched app=web.

The EndpointSlice contained the two Pod backend addresses.

The EndpointSlice backend port was TCP port 80.

The test Pod resolved web-service through cluster DNS.

The HTTP request reached nginx successfully and returned the nginx welcome page.

# Final Service Traffic Path

curl-test Pod

1

web-service:80

2

ClusterIP:10.96.82.166:80

3

selector: app=web

4

EndpointSlice Pod addresses:80

5

nginx container:80

# Lessons Learned

A Service discovers Pods through an exact match between its selector and the Pod labels.

An empty EndpointSlice usually indicates a selector mismatch or that no selected Pod is ready.

Successful DNS resolution confirms that the Service name and ClusterIP can be resolved, but it does not prove that the backend port is correct.

A connection refusal with populated endpoints can indicate an incorrect targetPort or that the application is not listening on that port.

The Service port is the port exposed by the Service.

The targetPort is the port used on the selected Pods.

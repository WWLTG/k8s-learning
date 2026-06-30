#! Kubernetes Service Inspection Commands

# List Services


kubectl get services
kubectl get svc
kubectl get svc -o wide


# Inspect One Service


kubectl describe svc web-service
kubectl get svc web-service -o yaml


# Check Pod Labels


kubectl get pods --show-labels
kubectl get pods -l app=web


# Check Endpoints


kubectl get endpoints
kubectl get endpoints web-service
kubectl describe endpoints web-service


The legacy Endpoints API may show a deprecation warning on newer Kubernetes versions.

# Check EndpointSlice


kubectl get endpointslices
kubectl get endpointslices -l kubernetes.io/service-name=web-service
kubectl describe endpointslice -l kubernetes.io/service-name=web-service


# Test Service Connectivity


kubectl run curl-test \
  --image=curlimages/curl:latest \
  --restart=Never \
  --rm -it \
  -- curl -sS http://web-service

# Useful Troubleshooting Path


Service
  1
selector
  2
Pod labels
  3
EndpointSlice
  4
targetPort
  5
Container listening port

# Service Lab 02

## Objective

Troubleshoot a ClusterIP Service that cannot route traffic to the API Pods.

The lab focuses on:

1. Service selectors
2. Pod labels
3. Service port
4. Named targetPort
5. Container port names
6. EndpointSlice inspection
7. Internal Service DNS testing

## Rules

Do not change the Deployment or Service before completing the initial investigation.

Preserve the broken state in Git before applying the manifests.

Do not add the solution to the investigation file.

## Initial Git Commit

Run these commands from the service-study project root after copying this lab into the labs directory.

git add labs/service-lab-02

git commit -m "Add broken Service Lab 02"

## Deploy the Broken Lab

kubectl apply -f labs/service-lab-02/manifests/

## Initial Inspection

kubectl get all -n service-lab-02

kubectl get pods -n service-lab-02 --show-labels

kubectl describe svc api-service -n service-lab-02

kubectl get endpointslices -n service-lab-02

## Connectivity Test

kubectl run curl-test -n service-lab-02 --rm -it --restart=Never --image=curlimages/curl -- curl -v http://api-service:8080

## Investigation Order

Service

Selector and Pod labels

EndpointSlice

Service port

Named targetPort

Container port name

Application listening port

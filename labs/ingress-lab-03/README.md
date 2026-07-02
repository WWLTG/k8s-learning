Ingress Controller Lab 03

Purpose

Practice installing and inspecting an Ingress Controller on a Kubernetes server.

This lab uses Traefik as the Ingress Controller.

The controller is exposed through NodePort so the lab can run on a server without an external LoadBalancer implementation.

Scenario

The application Deployment is healthy.

The application Service has ready endpoints.

The Traefik controller is installed and running.

The controller Service exposes HTTP through NodePort 30080.

A request using the required host does not reach the application.

Required request

Host: controller-lab.local

Path: /

Expected application response

Ingress Controller Lab 03

Rules

Preserve the broken state in Git before applying the lab.

Do not edit the manifests before completing the investigation.

Follow this investigation path:

Client
Node IP and NodePort
Controller Service
Controller Pod
IngressClass
Ingress
Backend Service
EndpointSlice
Application Pod

Prerequisites

A Kubernetes server cluster

kubectl configured for the server cluster

Helm version 3

Network access from the server to pull container images and the Helm chart

The server firewall must allow TCP port 30080 from the testing machine.

Controller installation

Add the official Traefik Helm repository:

helm repo add traefik https://traefik.github.io/charts

helm repo update

Install the controller:

helm upgrade --install traefik traefik/traefik --version 41.0.1 --namespace traefik --create-namespace -f controller/traefik-values.yaml

Wait for the controller:

kubectl rollout status deployment/traefik -n traefik

Inspect the controller:

kubectl get all -n traefik

kubectl get ingressclass

kubectl get service traefik -n traefik

Application deployment

Apply the namespace first:

kubectl apply -f manifests/00-namespace.yaml

Wait for the namespace:

kubectl wait --for=jsonpath='{.status.phase}'=Active namespace/ingress-controller-lab --timeout=30s

Apply the remaining resources:

kubectl apply -f manifests/01-deployment.yaml -f manifests/02-service.yaml -f manifests/03-ingress.yaml

Wait for the application:

kubectl rollout status deployment/controller-demo -n ingress-controller-lab

Initial inspection

kubectl get all -n ingress-controller-lab

kubectl get ingress -n ingress-controller-lab

kubectl describe ingress controller-demo -n ingress-controller-lab

kubectl get ingressclass -o wide

kubectl get endpointslice -n ingress-controller-lab

kubectl logs deployment/traefik -n traefik --tail=100

External test

Find the server node IP:

kubectl get nodes -o wide

Test the controller NodePort:

curl -H 'Host: controller-lab.local' http://SERVER_NODE_IP:30080/

Do not edit the manifests until the investigation identifies the broken link.

# ConfigMap Lab 01

# Scenario

A Deployment should load application settings from a ConfigMap.

The Kubernetes resources are accepted by the API server, but the application Pod does not become ready.

## Goal

Make the Pod run successfully and verify these environment variables inside the container:

- APP_ENV
- LOG_LEVEL
- WELCOME_MESSAGE

# Rules

- Do not replace the ConfigMap with hard-coded values in the Deployment.
- Investigate before editing the YAML files.
- Record commands, observations, and the root cause in investigation.md.
- Do not create the solution documentation until the lab is fixed.

## Start the Lab

kubectl apply -f namespace.yaml

kubectl apply -f configmap.yaml

kubectl apply -f deployment.yaml

# Initial Investigation

kubectl get pods -n configmap-lab

kubectl describe pod <pod-name> -n configmap-lab

kubectl get configmap -n configmap-lab

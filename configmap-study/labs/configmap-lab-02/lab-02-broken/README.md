ConfigMap Lab 02

Objective

Troubleshoot a ConfigMap mounted as a file inside a container.

The Pod should read this file:

/etc/app/app.properties

Starting State

The manifests are intentionally broken.

Do not edit the manifests before completing the investigation.

Apply the Lab

kubectl apply -f namespace.yaml

kubectl apply -f configmap.yaml -f deployment.yaml

Initial Inspection

kubectl get all -n configmap-volume-lab

kubectl get configmap -n configmap-volume-lab

kubectl describe pod -n configmap-volume-lab

Investigation Goal

Find why the container cannot start and why the expected configuration file is not created.

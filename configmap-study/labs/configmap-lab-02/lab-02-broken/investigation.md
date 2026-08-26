Investigation

Symptoms

The Pod remains in ContainerCreating.
The Deployment has zero available replicas.
The configuration file cannot be mounted.

Commands

kubectl get all -n configmap-volume-lab
kubectl describe pod configmap-volume-demo-6f8789bf86-xpvhk -n configmap-volume-lab
kubectl get events -n configmap-volume-lab --sort-by=.metadata.creationTimestamp
kubectl get configmap file-config -n configmap-volume-lab -o yaml
cat configmap.yaml
cat deployment.yaml

Observations

The file-config ConfigMap exists.
The Pod is waiting in ContainerCreating.
The volume mount fails before the container starts.
The Deployment requests the ConfigMap key application.properties.
The requested key does not exist in file-config.
The event reports configmap references non-existent config key application.properties.

Root Cause

The Deployment references a ConfigMap key named application.properties, but the existing key inside file-config has a different name.

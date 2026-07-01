# Investigation

## Symptoms

 The Pod remains in CreateContainerConfigError.
 The Deployment has zero available replicas.
 The container does not start.

## Commands

kubectl get all -n configmap-lab
kubectl get configmap -n configmap-lab
kubectl get pods -n configmap-lab
kubectl describe pod configmap-demo-7b96b7cc8c-b9nkd -n configmap-lab'
kubectl get configmap app-config -n configmap-lab -o yaml
cat deployment.yaml

# Observations

* The 'app-config' ConfigMap exists in the 'configmap-lab' namespace.
* The ConfigMap contains the keys 'APP_ENV', 'LOG_LEVEL', and 'WELCOME_MESSAGE'.
* The Deployment uses 'envFrom' to reference a ConfigMap named 'application-config'.
* No ConfigMap named 'application-config' exists.
* The Pod event reports 'configmap "application-config" not found'.
* The 'APP_ENV' environment variable requests the key 'APP_MODE' from 'app-config'.
* The "APP_MODE" key does not exist in 'app-config'.
* The first directory apply created the namespace, but the namespaced resources had to be applied again after the namespace became available.

# Root Cause

The Deployment contains two incorrect ConfigMap references.

The "envFrom" section references application-config, while the existing ConfigMap is named 'app-config'

The "configMapKeyRef" section requests the key "APP_MODE", while the existing key is named "APP_ENV"


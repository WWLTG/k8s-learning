Secret Lab Investigation

Symptom

The Deployment was not available.

The Pod remained in the following state:

CreateContainerConfigError

Investigation Commands

kubectl get deployments -n secret-lab

kubectl get pods -n secret-lab

kubectl get secrets -n secret-lab

kubectl describe pod secret-demo-7b79887dc8-c8nlk -n secret-lab

kubectl get events -n secret-lab --sort-by=.metadata.creationTimestamp

kubectl describe secret backend-secret -n secret-lab

kubectl get deployment secret-demo -n secret-lab -o jsonpath='{range .spec.template.spec.containers[0].env[*]}{.name}{" -> Secret: "}{.valueFrom.secretKeyRef.name}{" Key: "}{.valueFrom.secretKeyRef.key}{"\n"}{end}'

Observations

The Secret backend-secret existed in the secret-lab namespace.

The Secret contained two keys:

DB_USERNAME

DB_PASSWORD

The Deployment requested the following keys:

DB_USER

DB_PASSWORD

The Pod event reported:

couldn't find key DB_USER in Secret secret-lab/backend-secret

Root Cause

The Deployment referenced DB_USER, but the actual key stored in backend-secret was DB_USERNAME.

Because the Secret key was required and did not exist, Kubernetes could not create the container configuration.


Kubernetes Secret Inspection Commands

List Secrets

kubectl get secrets -n <namespace>

Inspect Secret metadata and keys

kubectl describe secret <secret-name> -n <namespace>

View the Secret manifest

kubectl get secret <secret-name> -n <namespace> -o yaml

View available data key names

kubectl get secret <secret-name> -n <namespace> -o json | jq '.data | keys'

Decode one demo value

kubectl get secret <secret-name> -n <namespace> -o jsonpath='{.data.<key>}' | base64 --decode; echo

Create a generic Secret from literals

kubectl create secret generic <secret-name> -n <namespace> --from-literal=username=demo-user --from-literal=password=demo-password

Generate YAML without creating the Secret

kubectl create secret generic <secret-name> -n <namespace> --from-literal=username=demo-user --from-literal=password=demo-password --dry-run=client -o yaml

Inspect Pods and events

kubectl get pods -n <namespace>
kubectl describe pod <pod-name> -n <namespace>
kubectl get events -n <namespace> --sort-by=.metadata.creationTimestamp

Inspect the Deployment reference

kubectl get deployment <deployment-name> -n <namespace> -o yaml

Check environment variable names without printing their values

kubectl exec -n <namespace> <pod-name> -- sh -c 'env | cut -d= -f1 | sort'

Check mounted Secret filenames

kubectl exec -n <namespace> <pod-name> -- ls -l /etc/app-secret

Security note

Use decoding commands only with training data. Avoid printing real Secret values in terminals, logs, screenshots, shell history, or CI output.

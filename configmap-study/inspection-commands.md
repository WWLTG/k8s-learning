# ConfigMap Inspection Commands

# List ConfigMaps

kubectl get configmaps

kubectl get configmaps -n <namespace>

# Inspect a ConfigMap

kubectl describe configmap <configmap-name> -n <namespace>

kubectl get configmap <configmap-name> -n <namespace> -o yaml

# Inspect Pods and Events

kubectl get pods -n <namespace>

kubectl describe pod <pod-name> -n <namespace>

kubectl get events -n <namespace> --sort-by=.metadata.creationTimestamp

# Inspect Environment Variables

kubectl exec -n <namespace> deployment/<deployment-name> -- printenv

kubectl exec -n <namespace> deployment/<deployment-name> -- printenv <variable-name>

# Inspect Mounted Files

kubectl exec -n <namespace> deployment/<deployment-name> -- ls -l <mount-path>

kubectl exec -n <namespace> deployment/<deployment-name> -- cat <file-path>

# Restart a Deployment

kubectl rollout restart deployment/<deployment-name> -n <namespace>

kubectl rollout status deployment/<deployment-name> -n <namespace>

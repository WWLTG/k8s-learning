Probe inspection commands

List Pods

kubectl get pods -n <namespace>

Watch Pod changes

kubectl get pods -n <namespace> -w

Show Pod details and events

kubectl describe pod <pod-name> -n <namespace>

Show Deployment details

kubectl describe deployment <deployment-name> -n <namespace>

Read current container logs

kubectl logs <pod-name> -n <namespace>

Read logs from the previous container instance

kubectl logs <pod-name> -n <namespace> --previous

Show container restart count and readiness

kubectl get pods -n <namespace> -o wide

Show probe configuration from the live Deployment

kubectl get deployment <deployment-name> -n <namespace> -o yaml

Show recent events

kubectl get events -n <namespace> --sort-by=.metadata.creationTimestamp

Show Service endpoints

kubectl get endpoints -n <namespace>

Show EndpointSlices

kubectl get endpointslices -n <namespace>

Test the application from inside a Pod

kubectl exec -n <namespace> <pod-name> -- wget -qO- http://127.0.0.1:<port>/<path>

Check rollout status

kubectl rollout status deployment/<deployment-name> -n <namespace>

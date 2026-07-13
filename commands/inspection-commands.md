NetworkPolicy Inspection Commands

List policies

kubectl get networkpolicy -A

Describe a policy

kubectl describe networkpolicy POLICY_NAME -n NAMESPACE

Show policy YAML

kubectl get networkpolicy POLICY_NAME -n NAMESPACE -o yaml

Show Pod labels

kubectl get pods -n NAMESPACE --show-labels

Show one Pod labels

kubectl get pod POD_NAME -n NAMESPACE -o jsonpath='{.metadata.labels}{"\n"}'

Show Namespace labels

kubectl get namespaces --show-labels

Show one Namespace labels

kubectl get namespace NAMESPACE --show-labels

Show Services and endpoints

kubectl get service,endpoints,endpointslice -n NAMESPACE

Test HTTP connectivity

kubectl exec -n SOURCE_NAMESPACE SOURCE_POD -- wget -qO- --timeout=3 http://SERVICE.NAMESPACE.svc.cluster.local

Test a specific port

kubectl exec -n SOURCE_NAMESPACE SOURCE_POD -- nc -vz -w 3 HOST PORT

Show recent events

kubectl get events -n NAMESPACE --sort-by=.metadata.creationTimestamp

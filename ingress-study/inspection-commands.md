Ingress Inspection Commands

Check all Ingress resources

kubectl get ingress -A

Show the Ingress in the lab namespace

kubectl get ingress -n ingress-lab

Show detailed Ingress information and events

kubectl describe ingress ingress-demo -n ingress-lab

Show the complete Ingress manifest

kubectl get ingress ingress-demo -n ingress-lab -o yaml

List available Ingress classes

kubectl get ingressclass

Show details for an Ingress class

kubectl describe ingressclass <class-name>

Check for common Ingress Controller Pods

kubectl get pods -A | grep -i ingress

Check the backend Service

kubectl get service ingress-demo-service -n ingress-lab

Show Service selectors and ports

kubectl describe service ingress-demo-service -n ingress-lab

Check EndpointSlices for the Service

kubectl get endpointslice -n ingress-lab -l kubernetes.io/service-name=ingress-demo-service

Show EndpointSlice addresses, readiness, and ports

kubectl get endpointslice -n ingress-lab -l kubernetes.io/service-name=ingress-demo-service -o yaml

Legacy endpoint view

kubectl get endpoints ingress-demo-service -n ingress-lab

Check Pods and labels

kubectl get pods -n ingress-lab --show-labels

Show Deployment details

kubectl describe deployment ingress-demo -n ingress-lab

Show Pod details and events

kubectl describe pod <pod-name> -n ingress-lab

Check container logs

kubectl logs <pod-name> -n ingress-lab

Test the Service from inside the cluster

kubectl run curl-test --rm -it --restart=Never --image=curlimages/curl -- curl -i http://ingress-demo-service.ingress-lab.svc.cluster.local

Test the application through a local Service port-forward

kubectl port-forward service/ingress-demo-service -n ingress-lab 8080:80

curl -i http://127.0.0.1:8080

Test an Ingress address while sending the required Host header

curl -i -H 'Host: ingress-lab.local' http://<ingress-address>/

Watch namespace events

kubectl get events -n ingress-lab --sort-by=.lastTimestamp

Useful API explanations

kubectl explain ingress
kubectl explain ingress.spec
kubectl explain ingress.spec.rules
kubectl explain ingress.spec.rules.http.paths
kubectl explain ingress.spec.rules.http.paths.backend.service

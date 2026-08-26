Ingress Lab 04 Investigation

Symptoms

All web and API Pods were Running and Ready.

Both Services were created successfully.

The Ingress resource was created, but its Address field remained empty.

The api-service had no endpoints.

No active Ingress Controller was running in the cluster.

Commands Used

kubectl get all -n ingress-lab-04

kubectl get ingress -n ingress-lab-04

kubectl describe ingress fanout-ingress -n ingress-lab-04

kubectl get svc -n ingress-lab-04 --show-labels

kubectl get endpointslice -n ingress-lab-04

kubectl describe service web-service -n ingress-lab-04

kubectl describe service api-service -n ingress-lab-04

kubectl get pods -n ingress-lab-04 --show-labels

kubectl get ingressclass

kubectl get deployments,daemonsets,pods,services -A

Observations

The /web path routed to web-service on port 80.

The /api path also routed to web-service on port 80.

The web-service selected Pods with the label app=web.

The web-service EndpointSlice contained all three web Pod IP addresses.

The api-service selected Pods with the label app=backend.

The API Pods used the label app=api.

The api-service EndpointSlice contained no endpoints.

An IngressClass named traefik existed.

No Traefik or ingress-nginx Controller Pods, Deployments, DaemonSets, or Services were running.

The Ingress resource requested the nginx IngressClass.

Root Causes

The /api Ingress backend referenced web-service instead of api-service.

The api-service selector did not match the labels on the API Pods.

The cluster did not have an active Ingress Controller.

The existing traefik IngressClass was an orphaned resource and did not provide traffic routing by itself.

Impact

Requests to /api would be sent to the web application instead of the API application.

The api-service could not forward traffic because it had no endpoints.

External Ingress requests could not be processed because no Ingress Controller was running.

Expected State

The /web path should route to web-service.

The /api path should route to api-service.

The api-service should select all three API Pods.

Both Services should have three ready endpoints.

An active Ingress Controller should process the fanout.local Ingress resource.

Repeated requests should reach multiple backend Pods.


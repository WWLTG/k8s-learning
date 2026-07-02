Ingress Lab 04
Fanout routing and Pod distribution

Goal

Create one Ingress resource that routes two URL paths to two different applications.
Verify that each Service has multiple Pod endpoints and that repeated requests are distributed across the Pods.

Expected routes

fanout.local/web/ -> web-service -> web Pods
fanout.local/api/ -> api-service -> api Pods

Expected replicas

web deployment: 3 Pods
api deployment: 3 Pods

Rules

Apply the broken manifests without editing them first.
Investigate from Ingress to Service to EndpointSlice to Pod.
Do not replace the manifests with new resources.
Fix only the fields that cause the routing failures.
Document the investigation before making the final fix.

Apply

kubectl apply -f manifests/

Initial inspection

kubectl get all -n ingress-lab-04
kubectl get ingress -n ingress-lab-04
kubectl describe ingress fanout-ingress -n ingress-lab-04
kubectl get svc -n ingress-lab-04
kubectl get endpointslices -n ingress-lab-04
kubectl get pods -n ingress-lab-04 --show-labels

Test requests

Use the same Ingress Controller address used in the previous Ingress labs.

curl -H 'Host: fanout.local' http://127.0.0.1/web/
curl -H 'Host: fanout.local' http://127.0.0.1/api/

Pod distribution test

for i in $(seq 1 12); do
  curl -s -H 'Host: fanout.local' http://127.0.0.1/web/
  echo
done

for i in $(seq 1 12); do
  curl -s -H 'Host: fanout.local' http://127.0.0.1/api/
  echo
done

Success conditions

Both routes return HTTP 200.
The web route returns names from the web Pods only.
The api route returns names from the api Pods only.
Repeated requests show more than one Pod name for each application.
Both Services have three ready endpoints.

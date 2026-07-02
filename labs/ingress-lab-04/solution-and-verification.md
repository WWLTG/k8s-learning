Ingress Lab 04 Solution and Verification

Fixes Applied

Changed the api-service selector from app=backend to app=api.

Changed the /api Ingress backend from web-service to api-service.

Changed the Ingress class from nginx to traefik.

Installed the Traefik Ingress Controller with Helm.

Verification Commands

kubectl get endpointslice -n ingress-lab-04

kubectl describe ingress fanout-ingress -n ingress-lab-04

kubectl get pods -n ingress-lab-04 --show-labels

kubectl get pods,svc -n traefik

curl -H 'Host: fanout.local' http://127.0.0.1:8080/web/

curl -H 'Host: fanout.local' http://127.0.0.1:8080/api/

Web Distribution Test

for i in $(seq 1 15)
do
curl -s -H 'Host: fanout.local' http://127.0.0.1:8080/web/
done | sort | uniq -c

Web Distribution Result

4 web pod: web-66f4b59bd-5tmjk
6 web pod: web-66f4b59bd-hfqp7
5 web pod: web-66f4b59bd-jcks6

API Distribution Test

for i in $(seq 1 15)
do
curl -s -H 'Host: fanout.local' http://127.0.0.1:8080/api/
done | sort | uniq -c

API Distribution Result

4 api pod: api-7d67997d86-222fd
6 api pod: api-7d67997d86-2lkb6
5 api pod: api-7d67997d86-dzczz

Final State

The /web path routes to web-service.

The /api path routes to api-service.

The web-service has three ready endpoints.

The api-service has three ready endpoints.

Traefik processes the Ingress resource.

Requests are distributed across all web Pods.

Requests are distributed across all API Pods.

Lessons Learned

An Ingress resource requires an active Ingress Controller.

IngressClass alone does not provide traffic routing.

Ingress backends must reference the correct Service.

Service selectors must match Pod labels.

EndpointSlices confirm which Pods are available behind a Service.

Load balancing happens across ready Service endpoints.

Pod distribution does not need to be perfectly equal for a small number of requests.


Investigation

Symptoms

The Traefik Ingress Controller was installed and running.

The application Deployment and Service were healthy.

The Ingress backend resolved to ready Pod endpoints.

Requests through the Traefik NodePort did not reach the application.

Expected request

Host: controller-lab.local

Path: /

Commands used

helm status traefik -n traefik

kubectl get pods,service -n traefik

kubectl get ingressclass -o wide

kubectl rollout status deployment/controller-demo -n ingress-controller-lab

kubectl get ingress controller-demo -n ingress-controller-lab

kubectl describe ingress controller-demo -n ingress-controller-lab

kubectl get endpointslice -n ingress-controller-lab

kubectl logs deployment/traefik -n traefik --tail=100

kubectl get nodes -o wide

curl -i -H 'Host: controller-lab.local' http://NODE_IP:30080/

Controller observations

The Traefik Deployment was available.

The Traefik Pod was Running and Ready.

The Traefik Service used NodePort.

HTTP traffic was exposed on NodePort 30080.

IngressClass observations

The available IngressClass was:

traefik

The controller was:

traefik.io/ingress-controller

Ingress observations

The Ingress requested the following class:

nginx

The configured host was:

controller-lab.local

The configured path was:

/

The backend Service was:

controller-demo-service

The backend Service port was:

80

Backend observations

The Service configuration was healthy.

The Ingress resolved the backend to:

10.244.0.9:80

10.244.0.8:80

The application Pods were Running and Ready.

Traffic path

Client

Node IP and NodePort 30080

Traefik Service

Traefik Pod

IngressClass traefik

Ingress requesting nginx

Traffic stopped at the IngressClass selection stage.

Root cause

The Ingress resource used ingressClassName nginx.

The installed Ingress Controller created an IngressClass named traefik.

Traefik did not manage the Ingress because the requested class did not match the available IngressClass.

Evidence

Available IngressClass:

traefik

Ingress requested class:

nginx

Required fix

Change ingressClassName from nginx to traefik.


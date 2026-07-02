Solution and Verification

Solution

The Ingress class was changed from nginx to traefik.

Before the fix

The installed IngressClass was:

traefik

The Ingress resource requested:

nginx

Traefik did not manage the Ingress because the class names did not match.

After the fix

The Ingress resource requested:

traefik

The Ingress class now matches the installed Traefik Ingress Controller.

Changed file

manifests/03-ingress.yaml

Changed configuration

Before:

ingressClassName: nginx

After:

ingressClassName: traefik

Apply command

kubectl apply -f manifests/03-ingress.yaml

Controller verification

The Helm release was deployed successfully.

The Traefik Deployment had one available replica.

The Traefik Pod was Running and Ready.

The Traefik Service used NodePort.

HTTP was exposed through NodePort 30080.

HTTPS was exposed through NodePort 30443.

IngressClass verification

The available IngressClass was:

traefik

The controller was:

traefik.io/ingress-controller

Ingress verification

The Ingress class was:

traefik

The configured host was:

controller-lab.local

The configured path was:

/

The backend Service was:

controller-demo-service

The backend Service port was:

80

Backend verification

The Ingress resolved the backend to:

10.244.0.9:80

10.244.0.8:80

Both application Pods were Running and Ready.

External test limitation

The kind node IP was:

10.89.0.2

Direct access to NodePort 30080 from the toolbox did not complete because the kind node was inside the Podman network.

A port-forward was used to test the Traefik Service.

Port-forward command

kubectl port-forward -n traefik service/traefik 8080:80

Test command

curl -i -H 'Host: controller-lab.local' http://127.0.0.1:8080/

Test result

HTTP/1.1 200 OK

Response body:

Ingress Controller Lab 03

Final traffic path

Client

Local port 8080

Traefik Service port 80

Traefik Pod port 8000

IngressClass traefik

Ingress controller-demo

Service controller-demo-service

Application Pods

Final result

The Traefik Ingress Controller was installed successfully.

The Ingress resource now uses the correct IngressClass.

Traefik accepted the route and forwarded the request to the application Service.

The backend application returned the expected response.

The Ingress Controller lab was completed successfully.

Lessons learned

An Ingress resource must reference an IngressClass managed by an installed Ingress Controller.

A healthy Service and EndpointSlice do not guarantee that external routing works.

Controller resources, IngressClass selection, routing rules, and backend resources must all be verified.

A port-forward can be used to test an Ingress Controller when a kind NodePort is not directly reachable from the host environment.


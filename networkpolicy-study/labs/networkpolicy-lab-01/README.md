NetworkPolicy Lab 01

Scenario

A web application must accept traffic only from approved clients.
One approved client is in the application Namespace.
Another approved client is in a trusted Namespace.
An unapproved client must remain blocked.
The approved application client must also have restricted Egress.

Required final behavior

same-allowed-client can reach web-service.
same-blocked-client cannot reach web-service.
trusted-client can reach web-service.
untrusted-client cannot reach web-service.
same-allowed-client can resolve DNS.
same-allowed-client can reach web-service.
same-allowed-client cannot reach api-service.

Rules

Do not edit manifests before collecting evidence.
Do not delete the lab directory.
Do not replace NetworkPolicy with a different networking tool.
Keep the lab lightweight.
Fix one problem at a time.
Commit the investigation separately before fixing the manifests.

Apply the broken lab

kubectl apply -f manifests/

Wait for the Deployments

kubectl rollout status deployment/web -n networkpolicy-lab-01
kubectl rollout status deployment/api -n networkpolicy-lab-01
kubectl rollout status deployment/same-allowed-client -n networkpolicy-lab-01
kubectl rollout status deployment/same-blocked-client -n networkpolicy-lab-01
kubectl rollout status deployment/trusted-client -n trusted-client
kubectl rollout status deployment/untrusted-client -n untrusted-client

List resources

kubectl get all -n networkpolicy-lab-01
kubectl get all -n trusted-client
kubectl get all -n untrusted-client
kubectl get networkpolicy -A

Use test-connectivity.sh after all Pods are Ready.

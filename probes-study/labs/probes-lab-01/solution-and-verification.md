Probes Lab 01 Solution and Verification

Solution

The readiness probe path was changed from /ready to /.

The default nginx page exists at the / path.

The liveness probe port was changed from 8080 to the named port http.

The named port http refers to container port 80.

Both probes now check the correct path and port.

Commands

kubectl apply -f manifests/deployment.yaml

kubectl rollout status deployment/probes-demo -n probes-lab

kubectl get pods -n probes-lab

kubectl get deployment -n probes-lab

kubectl get endpointslices -n probes-lab

kubectl describe pods -n probes-lab

Verification

The Deployment rollout completed successfully.

Both Pods reached the Running state.

Both Pods showed 1/1 readiness.

Both containers had zero restarts.

The Deployment showed two ready and two available replicas.

The EndpointSlice contained both Pod IP addresses.

The EndpointSlice exposed port 80.

The readiness probe successfully checked the / path on the named port http.

The liveness probe successfully checked the / path on the named port http.

Final result

The Pods are healthy and ready.

The liveness probe no longer restarts the containers.

The readiness probe allows the Pods to join the Service endpoints.

The Service can now send traffic to both Pods.


# Verification


kubectl get -n deployment-lab-01 po
NAME                              READY   STATUS    RESTARTS   AGE
web-deployment-6557c7b765-42mmm   1/1     Running   0          15s
web-deployment-6557c7b765-5q7vp   1/1     Running   0          15s
web-deployment-6557c7b765-8fmqw   1/1     Running   0          15s



kubectl rollout status deployment/web-deployment -n deployment-lab-01 --timeout=60s

result >> deployment "web-deployment" successfully rolled out


 Resource status


kubectl get deployment,replicaset,pods -n deployment-lab-01


Result >>
NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/web-deployment   3/3     3            3           3m38s

NAME                                        DESIRED   CURRENT   READY   AGE
replicaset.apps/web-deployment-6557c7b765   3         3         3       3m38s

NAME                                  READY   STATUS    RESTARTS   AGE
pod/web-deployment-6557c7b765-42mmm   1/1     Running   0          3m38s
pod/web-deployment-6557c7b765-5q7vp   1/1     Running   0          3m38s
pod/web-deployment-6557c7b765-8fmqw   1/1     Running   0          3m38s

All three Pods are Ready.
The Deployment is fully available.
The rollout completed successfully.


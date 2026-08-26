HPA Inspection Commands

Prerequisite check
kubectl top nodes
kubectl top pods -A
kubectl get apiservice | grep metrics
kubectl get pods -n kube-system | grep metrics

Apply the broken lab
kubectl apply -f labs/hpa-lab-01/manifests/

Basic checks
kubectl get all -n hpa-lab-01
kubectl get hpa -n hpa-lab-01
kubectl describe hpa hpa-demo-hpa -n hpa-lab-01

Workload checks
kubectl get deployment hpa-demo -n hpa-lab-01
kubectl describe deployment hpa-demo -n hpa-lab-01
kubectl get pods -n hpa-lab-01 -o wide
kubectl describe pod -n hpa-lab-01 -l app=hpa-demo

Metrics checks
kubectl top pods -n hpa-lab-01
kubectl top pod -n hpa-lab-01 -l app=hpa-demo

Events
kubectl get events -n hpa-lab-01 --sort-by=.lastTimestamp

HPA details
kubectl get hpa hpa-demo-hpa -n hpa-lab-01 -o yaml

Deployment resource section
kubectl get deployment hpa-demo -n hpa-lab-01 -o yaml

Watch scaling
kubectl get hpa hpa-demo-hpa -n hpa-lab-01 -w
kubectl get deployment hpa-demo -n hpa-lab-01 -w
kubectl get pods -n hpa-lab-01 -w

Clean up lab resources
kubectl delete namespace hpa-lab-01

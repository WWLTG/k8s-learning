Secret Lab 01

Goal

Run one Deployment that receives two values from a Kubernetes Secret.

Expected healthy state

The Deployment has one available replica.
The Pod is Running and Ready.
The container receives the required Secret values.

Rules

Preserve the untouched broken state in Git before applying it.
Apply only the manifests directory for this lab.
Do not inspect the example files as a solution.
Do not edit any manifest until the investigation is complete.
Do not print Secret values during the investigation.

Create the first commit from the secret-study project root

git init
git branch -M main
git add .
git commit -m "Add broken Secret lab"

Apply the broken lab

kubectl apply -f labs/secret-lab-01/manifests/

Start the investigation

kubectl get deployments -n secret-lab
kubectl get pods -n secret-lab
kubectl describe pod <pod-name> -n secret-lab
kubectl get events -n secret-lab --sort-by=.metadata.creationTimestamp

Documentation path

labs/secret-lab-01/notes/investigation.md
labs/secret-lab-01/notes/solution-and-verification.md

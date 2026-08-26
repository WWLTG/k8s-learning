HPA Lab 01

Goal
Troubleshoot why Horizontal Pod Autoscaler does not scale the application as expected under load.

Rules
- Do not edit the manifests before applying the broken lab.
- Commit the broken state first from the project root.
- Apply only the files inside this lab manifests directory.
- Investigate before changing anything.
- Fix one important issue at a time.
- Commit every important investigation or fix.

Apply
kubectl apply -f labs/hpa-lab-01/manifests/

Expected starting point
The workload should be created successfully.
The HPA should exist.
The load generator should create traffic.
The application should not scale correctly at first.

Your task
Find the root cause using kubectl commands.
Document the investigation.
Fix the problem step by step.
Verify that HPA can read metrics and scale replicas.

Do not write the final solution until the investigation is complete.

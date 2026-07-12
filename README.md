HPA Study

Purpose
This project is a focused Kubernetes study project for Horizontal Pod Autoscaler.

Rules
- Files are written in English.
- Examples are for reading only.
- Apply only the broken lab manifests when starting the lab.
- Do not add the solution before investigating.
- Preserve the broken lab in the first Git commit.

Project structure
- docs/: short concept notes.
- examples/: reading-only examples.
- commands/: inspection and workflow commands.
- labs/hpa-lab-01/: broken troubleshooting lab.

First Git commit
Run these commands from the project root:

git init
git branch -m main
git add .
git commit -m "Add broken HPA lab"

Start the lab
Run this only after the first commit:

kubectl apply -f labs/hpa-lab-01/manifests/

Recommended workflow
1. Apply the lab.
2. Inspect the HPA, Deployment, Pods, metrics, and events.
3. Write investigation notes.
4. Commit the investigation.
5. Fix one important issue at a time.
6. Verify scaling behavior.
7. Write solution-and-verification.md.
8. Make the final commit.

Git Workflow

Create the first commit before applying the lab

git init
git branch -m main
git status
git add .
git commit -m "Add broken HPA lab"

After applying and investigating

git status
git add labs/hpa-lab-01/investigation.md
git commit -m "Document HPA investigation"

After an important fix

git status
git add labs/hpa-lab-01/manifests/01-deployment.yaml
git commit -m "Add CPU requests for HPA metrics"

After final verification

git status
git add labs/hpa-lab-01/solution-and-verification.md
git commit -m "Solve HPA CPU scaling lab"

View history

git log --oneline --graph --decorate

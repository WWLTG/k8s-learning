# Job Lab 01

## Focus

- Job
- Completions
- Retries
- Pod failure
- Job conditions

## Scenario

A batch report Job should complete three successful tasks.

The Job creates Pods, but the required completions are not reached.

Investigate why the Pods fail and why the Job retries.

## Rules

- Apply the manifests without editing them.
- Collect baseline output first.
- Use Job status, Pod status, logs, and events.
- Document the direct evidence.
- Fix only the root cause.
- Keep the lab lightweight.

## Apply

kubectl apply -f manifests/00-namespace.yaml

kubectl apply -f manifests/01-job.yaml

## Baseline checks

kubectl get job,pod -n job-lab-01

kubectl describe job report-generator -n job-lab-01

kubectl get pods -n job-lab-01

kubectl logs -n job-lab-01 POD_NAME

kubectl get events -n job-lab-01 --sort-by=.metadata.creationTimestamp

## Investigation goal

Explain:

- Why each Pod exits with failure
- How backoffLimit affects the Job
- Why completions remains incomplete
- Which exact manifest line causes the failure

## First commit

Add broken Job lab

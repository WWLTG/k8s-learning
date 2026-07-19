# CronJob Lab 02

## Focus

- CronJob
- Schedule
- Suspend
- Job creation
- Job history

## Scenario

A scheduled history task should create a Job every minute.

The CronJob object exists, but no scheduled Jobs appear.

Investigate the CronJob configuration and determine why the schedule is not producing Jobs.

## Rules

- Apply the manifests without editing them.
- Collect baseline output first.
- Inspect the schedule and suspend state.
- Confirm whether Jobs and Pods are created.
- Document the direct evidence.
- Fix only the root cause.
- Keep the lab lightweight.

## Apply

kubectl apply -f manifests/00-namespace.yaml

kubectl apply -f manifests/01-cronjob.yaml

## Baseline checks

kubectl get cronjob -n cronjob-lab-02

kubectl describe cronjob history-demo -n cronjob-lab-02

kubectl get jobs,pods -n cronjob-lab-02

kubectl get events -n cronjob-lab-02 --sort-by=.metadata.creationTimestamp

## Investigation goal

Explain:

- Whether the cron expression is valid
- Whether scheduling is enabled
- Why Last Schedule Time is empty
- Why no Job history exists
- Which exact field blocks new Jobs

## Verification after the fix

Wait for the next schedule.

kubectl get cronjob,jobs,pods -n cronjob-lab-02

kubectl get jobs -n cronjob-lab-02 --sort-by=.metadata.creationTimestamp

kubectl logs -n cronjob-lab-02 job/JOB_NAME

## First commit

Add broken CronJob lab

# Jobs and CronJobs Study

This project covers the final workload concepts in the Kubernetes fundamentals track.

## Scope

- Job
- CronJob
- Completions
- Retries
- Schedule
- Job history

## Project structure

- docs contains the concept review.
- examples contains healthy reference manifests.
- commands contains inspection and troubleshooting commands.
- labs contains intentionally broken lightweight labs.

## Study workflow

1. Read the concept file.
2. Review the healthy examples.
3. Apply the broken lab without editing it.
4. Collect baseline output.
5. Investigate with kubectl.
6. Write the investigation notes.
7. Commit the investigation.
8. Fix only the root cause.
9. Verify the result.
10. Write the solution and verification notes.
11. Commit the final fix.

## Lab order

1. job-lab-01
2. cronjob-lab-02

## Important

All Kubernetes commands should be executed inside the k8s toolbox environment.

The labs use short BusyBox commands and do not intentionally create CPU, memory, disk, or network pressure.

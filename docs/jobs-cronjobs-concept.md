# Jobs and CronJobs Concept

## Job

A Job runs a task until the required number of successful Pod completions is reached.

A Deployment is intended to keep Pods running.

A Job is intended to finish work and stop.

Common Job use cases include:

- Database migrations
- Backup tasks
- Batch processing
- Report generation
- One-time administrative tasks

## Job lifecycle

The Job controller creates one or more Pods.

The Pods run the configured command.

A successful Pod exits with status code 0.

A failed Pod exits with a non-zero status code.

The Job becomes Complete when the required successful completions are reached.

The Job becomes Failed when the retry limit is exhausted.

## Completions

The completions field defines how many successful Pod executions are required.

Example:

completions: 3

The Job is complete only after three successful completions.

## Parallelism

The parallelism field defines how many Job Pods may run at the same time.

Example:

parallelism: 1

The Job runs one Pod at a time.

Parallelism is included only as supporting context for completions.

## Retries

The backoffLimit field controls how many retries are allowed before the Job is marked failed.

Example:

backoffLimit: 2

Failed Pods may be replaced until the retry limit is reached.

The Pod restart policy for a Job is normally Never or OnFailure.

## CronJob

A CronJob creates Jobs according to a schedule.

The execution chain is:

CronJob
Job
Pod
Container command

A CronJob does not directly run the application container.

It creates a Job, and the Job creates the Pod.

## Schedule

The schedule field uses five cron fields.

minute hour day-of-month month day-of-week

Example:

*/5 * * * *

This schedule runs every five minutes.

CronJob schedules should be quoted in YAML.

## Suspend

The suspend field controls whether new Jobs may be scheduled.

suspend: true

No new Jobs are created.

suspend: false

The CronJob may create Jobs according to its schedule.

Existing Jobs are not removed when a CronJob is suspended.

## Job history

CronJob history limits control how many completed Jobs remain visible.

successfulJobsHistoryLimit controls successful Jobs.

failedJobsHistoryLimit controls failed Jobs.

Example:

successfulJobsHistoryLimit: 2
failedJobsHistoryLimit: 1

These fields limit Job history objects.

They do not control application log retention outside the cluster.

## Important status fields

For Jobs:

- Active
- Succeeded
- Failed
- Complete condition
- Failed condition

For CronJobs:

- Schedule
- Suspend
- Last Schedule Time
- Active Jobs

## Troubleshooting path

For a Job:

Job
Pod
Pod status
Container logs
Exit code
Job conditions

For a CronJob:

CronJob
Schedule
Suspend
Created Job
Created Pod
Container logs
History limits

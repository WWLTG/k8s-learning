# Inspection Commands

## General context

kubectl config current-context

kubectl get nodes

kubectl get namespaces

## Jobs

kubectl get jobs -n job-lab-01

kubectl get jobs -n job-lab-01 -o wide

kubectl describe job report-generator -n job-lab-01

kubectl get pods -n job-lab-01

kubectl get pods -n job-lab-01 --show-labels

kubectl get pods -n job-lab-01 -l job-name=report-generator

kubectl describe pod -n job-lab-01 POD_NAME

kubectl logs -n job-lab-01 POD_NAME

kubectl get job report-generator -n job-lab-01 -o yaml

kubectl get events -n job-lab-01 --sort-by=.metadata.creationTimestamp

kubectl get job report-generator -n job-lab-01 -o jsonpath='{.spec.completions}{"
"}'

kubectl get job report-generator -n job-lab-01 -o jsonpath='{.spec.parallelism}{"
"}'

kubectl get job report-generator -n job-lab-01 -o jsonpath='{.spec.backoffLimit}{"
"}'

kubectl get job report-generator -n job-lab-01 -o jsonpath='{.status.succeeded}{"
"}'

kubectl get job report-generator -n job-lab-01 -o jsonpath='{.status.failed}{"
"}'

kubectl wait --for=condition=complete job/report-generator -n job-lab-01 --timeout=60s

## CronJobs

kubectl get cronjobs -n cronjob-lab-02

kubectl get cronjob history-demo -n cronjob-lab-02 -o wide

kubectl describe cronjob history-demo -n cronjob-lab-02

kubectl get cronjob history-demo -n cronjob-lab-02 -o yaml

kubectl get jobs -n cronjob-lab-02

kubectl get pods -n cronjob-lab-02

kubectl get events -n cronjob-lab-02 --sort-by=.metadata.creationTimestamp

kubectl get cronjob history-demo -n cronjob-lab-02 -o jsonpath='{.spec.schedule}{"
"}'

kubectl get cronjob history-demo -n cronjob-lab-02 -o jsonpath='{.spec.suspend}{"
"}'

kubectl get cronjob history-demo -n cronjob-lab-02 -o jsonpath='{.spec.successfulJobsHistoryLimit}{"
"}'

kubectl get cronjob history-demo -n cronjob-lab-02 -o jsonpath='{.spec.failedJobsHistoryLimit}{"
"}'

kubectl get cronjob history-demo -n cronjob-lab-02 -o jsonpath='{.status.lastScheduleTime}{"
"}'

kubectl get jobs -n cronjob-lab-02 --sort-by=.metadata.creationTimestamp

kubectl logs -n cronjob-lab-02 job/JOB_NAME

## Manual CronJob verification

kubectl create job --from=cronjob/history-demo manual-history-check -n cronjob-lab-02

kubectl wait --for=condition=complete job/manual-history-check -n cronjob-lab-02 --timeout=60s

kubectl logs -n cronjob-lab-02 job/manual-history-check

## Cleanup

kubectl delete namespace job-lab-01

kubectl delete namespace cronjob-lab-02

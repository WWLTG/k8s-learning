Observed failure

The report-generator Job failed with zero of three required completions
Three Pods were created and all ended with Error status

Evidence

The Job reported zero succeeded Pods and three failed Pods
The container logs showed only the task starting message
The Job event reported BackoffLimitExceeded
The command tests for the file /work/input.txt

Root cause

The container expects /work/input.txt to exist but the file is never created or mounted
The test command exits with a non-zero status
The set -e option stops the script immediately
The Job retries until backoffLimit 2 is exceeded



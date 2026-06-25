# Pod Lab 02: CrashLoopBackOff Investigation

# Symptoms

The Pod repeatedly changes between:

1 Running
2 Error
3 CrashLoopBackOff

The container restart count continues increasing.

# Investigation Commands

kubectl get pod crashloop-demo

kubectl describe pod crashloop-demo

kubectl logs crashloop-demo

kubectl logs crashloop-demo --previous

# Findings

The container starts successfully but exits with code 1.

The nginx configuration test fails because the requested configuration file does not exist:

/etc/nginx/nginx-lab.conf

The shell script uses:

set -e

Therefore, the script exits immediately when the nginx configuration test fails.

The Pod uses:

restartPolicy: Always

Kubernetes repeatedly restarts the failed container.

# Root Cause

The container command references a nonexistent nginx configuration file.

# Expected Fix

Use the existing nginx configuration file:

/etc/nginx/nginx.conf

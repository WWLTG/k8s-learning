StatefulSet Study

Goal

Understand how StatefulSet works and how it differs from Deployment.

Main points

StatefulSet gives each Pod a stable name.

StatefulSet creates Pods in order.

StatefulSet deletes Pods in reverse order.

StatefulSet can give each Pod its own PersistentVolumeClaim.

StatefulSet usually works with a Headless Service for stable Pod DNS.

Important objects

StatefulSet
Headless Service
PersistentVolumeClaim
volumeClaimTemplates
serviceName
Pod ordinal
Stable DNS
Stable storage

Do not apply files from the examples directory during the lab.

Use the examples only for reading.

StatefulSet Lab 01

Scenario

A Redis StatefulSet should run with three replicas.

Each Pod should have:

Stable name
Stable DNS
Own PVC
Persistent data

Expected final state

redis-0 Running and Ready
redis-1 Running and Ready
redis-2 Running and Ready

Headless Service has endpoints.

The following DNS names should work:

redis-headless
redis-0.redis-headless
redis-1.redis-headless
redis-2.redis-headless

Data written inside redis-0 should survive deleting redis-0.

Rules

Do not delete the lab directory.

Do not recreate the whole lab from scratch.

Investigate first.

Fix only the broken fields.

Document your investigation in investigation.md.

Document your final solution and verification in solution-and-verification.md.

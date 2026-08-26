Observed failure

The Deployment remained at 1/2 replicas.

Evidence

The ReplicaSet reported FailedCreate.

The second Pod was rejected because it requested 200m CPU while 200m was already used and the ResourceQuota allowed only 300m.

Root cause

The LimitRange assigns a default CPU request of 200m to each Container.

Two replicas require 400m total CPU requests, but the ResourceQuota allows only 300m.


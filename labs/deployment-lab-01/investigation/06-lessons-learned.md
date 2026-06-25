# Lessons Learned

## Main lesson


## Investigation order that helped

```text
Deployment
↓
ReplicaSet
↓
Pod
↓
Events and logs
```

## English summary

```text
A Running Pod is not always a Ready Pod.
Deployment availability depends on Pod readiness.
Events may be more useful than logs for configuration problems.
```

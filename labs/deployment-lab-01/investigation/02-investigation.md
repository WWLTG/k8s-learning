# Investigation

## Deployment inspection

```bash
kubectl describe deployment web-deployment -n deployment-lab-01
```

ماذا لاحظت؟


## ReplicaSet inspection

```bash
kubectl describe replicaset <replicaset-name> -n deployment-lab-01
```

ماذا لاحظت؟


## Pod inspection

```bash
kubectl describe pod <pod-name> -n deployment-lab-01
```

ماذا ظهر في قسم الأحداث؟


## Logs

```bash
kubectl logs <pod-name> -n deployment-lab-01
```

هل التطبيق يتوقف، أم يعمل لكن لا يصبح جاهزًا؟


## English notes

```text
The container is running.
The Pod is not Ready.
The events provide the strongest clue.
```

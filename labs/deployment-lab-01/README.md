# Deployment Lab 01

## الهدف

فهم العلاقة التالية عمليًا:

```text
Deployment
↓ creates and manages
ReplicaSet
↓ creates and manages
Pods
```

هذا المختبر يحتوي مشكلة منطقية واحدة.

ملف `YAML` صالح، وسيتم إنشاء الموارد، لكن حالة التطبيق لن تكون سليمة.

لا تفتح مجلد `solved` قبل إنهاء التحقيق.

---

## 1. تثبيت النسخة المكسورة في Git

من داخل مجلد `deployment-study`:

```bash
git add documentation examples commands labs/deployment-lab-01/broken labs/deployment-lab-01/working labs/deployment-lab-01/investigation README.md .gitignore
git commit -m "Add broken Deployment lab"
```

---

## 2. تشغيل المختبر

```bash
kubectl apply -f labs/deployment-lab-01/broken/deployment.yaml
```

انتظر عدة ثوانٍ، ثم ابدأ التحقيق.

---

## 3. ترتيب التحقيق

```bash
kubectl get deployment -n deployment-lab-01
```

```bash
kubectl get replicaset -n deployment-lab-01
```

```bash
kubectl get pods -n deployment-lab-01
```

```bash
kubectl describe deployment web-deployment -n deployment-lab-01
```

احصل على اسم `ReplicaSet`:

```bash
kubectl get replicaset -n deployment-lab-01
```

ثم:

```bash
kubectl describe replicaset <replicaset-name> -n deployment-lab-01
```

احصل على اسم أحد `Pods`:

```bash
kubectl get pods -n deployment-lab-01
```

ثم:

```bash
kubectl describe pod <pod-name> -n deployment-lab-01
```

```bash
kubectl logs <pod-name> -n deployment-lab-01
```

افحص الأحداث:

```bash
kubectl get events -n deployment-lab-01 --sort-by=.metadata.creationTimestamp
```

---

## 4. تأكيد سلسلة الملكية

```bash
kubectl get rs -n deployment-lab-01 \
  -o custom-columns=NAME:.metadata.name,OWNER:.metadata.ownerReferences[0].name,DESIRED:.spec.replicas,READY:.status.readyReplicas
```

```bash
kubectl get pods -n deployment-lab-01 \
  -o custom-columns=NAME:.metadata.name,OWNER:.metadata.ownerReferences[0].name,READY:.status.containerStatuses[0].ready,PHASE:.status.phase
```

يجب أن تلاحظ:

```text
Deployment owns ReplicaSet.
ReplicaSet owns Pods.
```

---

## 5. توثيق التحقيق

املأ الملفات الموجودة داخل:

```text
investigation/
```

بعد ذلك:

```bash
git add labs/deployment-lab-01/investigation
git commit -m "Document Deployment investigation"
```

---

## 6. العمل على النسخة القابلة للتعديل

عدّل فقط:

```text
working/deployment.yaml
```

ثم طبّقها:

```bash
kubectl apply -f labs/deployment-lab-01/working/deployment.yaml
```

---

## 7. التحقق من الحل

```bash
kubectl rollout status deployment/web-deployment -n deployment-lab-01 --timeout=60s
```

```bash
kubectl get deployment,replicaset,pods -n deployment-lab-01
```

```bash
kubectl get pods -n deployment-lab-01 -o wide
```

الحالة المطلوبة:

```text
Deployment: AVAILABLE = 3
ReplicaSet: READY = 3
Pods: READY = 1/1
```

بعد نجاح الحل، قارن ملفك مع:

```text
solved/deployment.yaml
```

ثم:

```bash
git add labs/deployment-lab-01/working labs/deployment-lab-01/solved
git commit -m "Solve Deployment Lab 01"
```

---

## 8. تنظيف المختبر

```bash
kubectl delete namespace deployment-lab-01
```

# Deployment Lab 01 - Solution Notes

## Root cause

الحاويات تعمل على المنفذ:

```text
80
```

لكن فحص الجاهزية كان يحاول الاتصال بالمنفذ:

```text
8080
```

لهذا بقيت الحاويات في حالة تشغيل، بينما بقيت `Pods` غير جاهزة.

## Important distinction

```text
Running does not mean Ready.
```

حالة التشغيل تعني أن عملية الحاوية تعمل.

حالة الجاهزية تعني أن الحاوية أصبحت جاهزة لاستقبال حركة الشبكة.

## Relationship

```text
Deployment created the ReplicaSet.
ReplicaSet created three Pods.
The Pods were Running but not Ready.
Therefore, the Deployment had zero available replicas.
```

## Fix

تم تغيير منفذ فحص الجاهزية من:

```text
8080
```

إلى:

```text
80
```

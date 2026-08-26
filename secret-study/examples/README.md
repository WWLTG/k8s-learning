Kubernetes Secret Examples

Purpose

These files are reference examples for reviewing the main ways a Pod can use a Kubernetes Secret.

Do not apply these files as part of the broken lab.
The broken lab is investigated and fixed separately.

Example files

01-secret-stringdata.yaml

Creates an Opaque Secret named app-secret in the secret-example namespace.
It uses stringData so the values can be written as plain text in the manifest.
Kubernetes stores the values under data after creating the Secret.

02-secret-env.yaml

Creates a Deployment that imports individual Secret keys as environment variables.
It uses secretKeyRef.

APP_USERNAME reads the username key.
APP_PASSWORD reads the password key.

The Secret name and key name must both exist.

03-secret-envfrom.yaml

Creates a Deployment that imports every key from app-secret as an environment variable.
It uses envFrom with secretRef.

The environment variable names are taken directly from the Secret key names.

04-secret-volume.yaml

Creates a Pod that mounts app-secret as a read-only volume at:

/etc/app-secret

Each Secret key becomes a file inside the mounted directory.
The file content is the value stored in that Secret key.

Important relationships

secretKeyRef.name must match the Secret metadata.name.
secretKeyRef.key must match an existing key inside the Secret.
secretRef.name must match the Secret metadata.name.
secretName must match the Secret metadata.name.
volumeMounts.name must match volumes.name.
The Secret and the workload using it must be in the same namespace.

Security notes

Base64 encoding is not encryption.
Do not commit real passwords, tokens, certificates, or private keys to Git.
Use placeholder values in study examples.

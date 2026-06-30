# ConfigMap Concept

A ConfigMap stores non-sensitive application configuration outside a container image.

Typical values include:

- Application mode
- Log level
- Service URLs
- Feature flags
- Configuration file content

Do not use a ConfigMap for passwords, tokens, certificates, or private keys. Use a Secret for sensitive values.

## Main Usage Methods

### Single Value

Use `configMapKeyRef` when a container needs one specific key.

### All Values

Use `envFrom` when every ConfigMap key should become an environment variable.

### Files

Mount the ConfigMap as a volume when the application expects configuration files.

## Important Behavior

Environment variables are loaded when the container starts. Updating the ConfigMap does not update environment variables inside an existing container.

A Deployment restart is normally required after changing ConfigMap values used as environment variables.

Mounted ConfigMap files may be updated automatically, but the application must reload or reread them.

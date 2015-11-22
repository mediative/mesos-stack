# docker-registry

```yaml
---
# Configuration that will be injected into the Marathon application descriptor.
docker_registry:
  vhost: docker.mesos.dev
  auth:
    htpasswd:
      realm: Mediative
      credentials: []
  s3:
    accesskey: AWS_ACCESS_KEY_ID
    secretkey: AWS_SECRET_ACCESS_KEY
    region: us-east-1
    bucket: docker-registry-FIXME # S3 bucket where to store registry files; must exist
```

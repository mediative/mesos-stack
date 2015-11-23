# docker-engine-auth - Private Registry Authentication

As explained in the [Marathon
docs](https://mesosphere.github.io/marathon/docs/native-docker-private-registry.html)
using private registries requires that credentials are provided using an
archive. This archive is generated during cluster provisioning on all Mesos
agents based on credentials in `credentials/secret.yml`.

Requires the credentials for all Docker registries to log into to be defined via
`docker_credentials`. For each registry, specify the server, username, password
and email. E.g.:

```yaml
docker_credentials:
  - server: docker.example.com
    username: pull-user
    password: secret
    email: pull-user@example.com
  - server: quay.io
    username: pull-user2
    password: secret
    email: pull-user2@example.com
```

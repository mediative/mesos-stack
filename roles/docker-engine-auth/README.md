# Docker Private Registry Authentication

As explained in the [Marathon
docs](https://mesosphere.github.io/marathon/docs/native-docker-private-registry.html)
using private registries requires that credentials are provided using an
archive. This archive is generated during cluster provisioning on all Mesos
agents based on credentials in `credentials/secret.yml`.

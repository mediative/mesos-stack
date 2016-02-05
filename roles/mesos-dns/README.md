# Mesos DNS

Install the Mesos DNS Go binary and configure it as a system service.

Nodes are configured to use Mesos DNS by the [mesos](../mesos/README.md) role.

## Configuration

Defaults are set in `defaults/main.yml`.

 - `mesos_dns_version`:

   The version to install. See
   [releases](https://github.com/mesosphere/mesos-dns/releases) for supported
   versions.

   Example:
   ```yaml
   mesos_dns_version: "0.5.1"
   ```

 - `mesos_dns_bin`

   Path to where the Mesos DNS binary should be installed.

   Example:
   ```yaml
   mesos_dns_bin: "/opt/mesos-dns-{{mesos_dns_version}}"
   ```

 - `mesos_dns_resolvers`

   An ordered list of DNS resolvers to use for external lookups. 

   Example:
   ```yaml
   mesos_dns_resolver:
    - 10.10.10.10 # Internal
    - 8.8.8.8 # Google
   ```

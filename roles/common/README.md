# Common

Install base packages and updates `/etc/hosts` with mappings to all hosts in
the cluster.

## Configuration

Defaults are set in `defaults/main.yml`.

 - `host_mappings`

   List defining additional `/etc/hosts` mappings. Each entry should define `ip`
   and `name`.

   Example:
   ```yaml
   host_mappings:
     - { ip: '52.7.220.1', name: 'docker-registry.example.org' }
   ```

# Mesos Cluster

Scripts to configure a Mesos cluster using Mesos and Mesosphere services.

The main features are:

 - Mesos master running the Marathon and Chronos frameworks
 - Mesos agent with Docker containerizer
 - Mesos DNS for core service discovery
 - Marathon load balancer using HAProxy for SSL and proxying to internal
   applications

To try it out locally use the [Vagrant](vagrant/README.md) configuration.

[![Build Status](https://travis-ci.org/mediative/mesos-stack.svg?branch=master)](https://travis-ci.org/mediative/mesos-stack)
[![GitHub release](https://img.shields.io/github/release/mediative/mesos-stack.svg)](https://github.com/mediative/mesos-stack/releases/latest)

## Usage

To use the scripts to build a custom Mesos cluster first install the roles in
your project:

    $ ansible-galaxy install --force --roles-path .ansible \
        https://github.com/mediative/mesos-stack,0.4.0

and configure Ansible to load roles from the roles directory provided by this
project.

`ansible.cfg`:
```ini
[defaults]
roles_path = .ansible/mesos-stack/roles
```

Alternatively, you can also use a `requirements.yml` file:

```yaml
- src: https://github.com/mediative/mesos-stack
  path: .ansible
  version: 0.4.0
```

and pull down the roles to your DevOps setup by running:

    $ ansible-galaxy install -r requirements.yml

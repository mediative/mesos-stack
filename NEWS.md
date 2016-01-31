# Release notes

## master

Fixes:

 - mesos-agent: Store logs in `/var/log/mesos` so they can be analyzed after
   rebooting a node.

## 0.1.0

First official release based on Mesos version 0.25.0.

The main features are:

 - Mesos master running Marathon 0.13.0 and Chronos 2.4.0
 - Mesos agent with Docker containerizer and cgroups isolation enabled
 - Mesos DNS 0.5.1 for core service discovery
 - Marathon load balancer using HAProxy for SSL and proxying to internal
   applications

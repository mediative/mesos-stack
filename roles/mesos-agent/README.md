# Mesos Agent

Configure the Mesos agent to use both the docker and mesos containerizers and
enable the `cgroup` isolator, since the default POSIX isolator doesn’t provide
the same robust isolation guarantees. To gracefully handle larger docker images,
the executor registration timeout is set to 5 minutes.

Depends on the [mesos](../mesos/README.md) role.

No supported configuration variables.

## Hooks

If the `reset_agent` variable is set, all agent state files are deleted and the
agent is restarted which is useful if an agent has become unresponsive.

Usage

    ansible-playbook --extra-vars "reset_agent=yes" site.yml

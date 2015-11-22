# Running Mesos Cluster with Vagrant

The local cluster will have three nodes:

 - mesos-node-0 (10.141.141.10):
   - Zookeeper
   - Mesos master
   - Mesos agent
   - HAProxy/Marathon load balancer

 - mesos-node-1 (10.141.141.11):
   - Mesos agent
   - Mesos DNS

 - mesos-node-2 (10.141.141.12):
   - Mesos agent

First, bring up the local cluster VMs:

    $ cd contrib/vagrant
    $ vagrant up

Then install and configure the DCOS CLI:

    $ pip install dcoscli
    $ dcos config set core.email no-auth@example.com
    $ dcos config set core.reporting false
    $ dcos config set core.mesos_master_url http://10.141.141.10:5050
    $ dcos config set marathon.url http://10.141.141.10:8080
    $ dcos config set package.cache ~/.dcos/cache
    $ dcos config set package.sources "https://github.com/mesosphere/universe/archive/version-1.x.zip" ]'

Finally, add the following to `/etc/hosts` if you plan to deploy example apps descriptors located inside the `apps` directory:

```sh
# Proxied domains should point to the primary node
10.141.141.10   nginx.mesos.dev
```

## Using the cluster

The main user interfaces are:

 - Mesos:    http://10.141.141.10:5050/
 - Marathon: http://10.141.141.10:8080/
 - Chronos:  http://10.141.141.10:4400/

To deploy applications use the DCOS CLI and the Marathon task descriptors in the `contrib/marathon` folder:

    $ dcos marathon app add contrib/marathon/nginx.json

Check that nginx is running:

    $ dcos marathon task list
    APP        HEALTHY          STARTED               HOST      ID
    /nginx       True   2015-11-12T04:04:08.872Z  mesos-node-0  nginx.6bf52812-88f2-11e5-a52e-0242bb5202d1

Once the application has been started, open https://nginx.mesos.dev/.

To undeploy nginx run:

    $ dcos marathon app remove nginx

See `dcos marathon -h` for more commands.

## Vagrant cheat sheet

The following commands gives a quick intro to Vagrant

```sh
vagrant ssh mesos-node-0   # SSH into a machine
vagrant provision          # Rerun Ansible scripts
vagrant halt               # Stop all cluster VMs
vagrant destroy            # Physically delete VM files
```

For additional help run `vagrant help`.

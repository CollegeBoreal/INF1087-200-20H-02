# Multipass


https://github.com/canonical/multipass/issues/567#issuecomment-702801046



> Could you provide an example of the cloud-init trickery you speak of?

That would actually be netplan trickery. Create /etc/netplan/90-static.yaml with something like the following:

```yaml
network:
    ethernets:
        enp5s0:
            addresses:
            - 10.10.10.10/24
    version: 2
```

Use netplan try to verify the configuration, or netplan apply if you're certain of it ;)

You will also need to add a corresponding IP, or route, to the new segment on your host:

```
$ sudo ip route add 10.10.10.0/24 dev mpbr0
```

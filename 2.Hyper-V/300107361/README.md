# Devoir Hyper-V

### :one: Creer trois Machines Virtuelles

Sur la meme switch virtuelle

:a: Creation des deux premieres machines virtuelles avec:

```
docker-machine create --driver hyperv CB-HYPERV


PS C:\Users\Administrator> docker-machine create --driver hyperv CB-HYPERV
Running pre-create checks...
Creating machine...
(CB-HYPERV) Copying C:\Users\Administrator\.docker\machine\cache\boot2docker.iso to C:\Users\Administrator\.docker\machine\machines\CB-HYPERV\boot2docker.iso...
(CB-HYPERV) Creating SSH key...
(CB-HYPERV) Creating VM...
(CB-HYPERV) Using switch "Primary Virtual Switch"
(CB-HYPERV) Creating VHD
(CB-HYPERV) Starting VM...
(CB-HYPERV) Waiting for host to start...
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...

```
:ab: 
```
docker-machine create --driver hyperv CB-HYPERV2
```

### :two: Une des machines doit avoir 2 CPU et 4Gb de memoire

© 
```
docker-machine create --driver hyperv CB-HYPERV --hyperv-memory 4 Gb --hyperv-cpu-count 2
```

### :three: Rajouter un volume VHDx a une des machines

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
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\ProgramData\chocolatey\lib\docker-machine\bin\docker-machine.exe env CB-HYPERV
```

### :two: Une des machines doit avoir 2 CPU et 4Gb de memoire

:m: 
```
PS C:\Windows\system32> $HYPERV_MEMORY = 4096
PS C:\Windows\system32> $HYPERV_CPU_COUNT = 2
PS C:\Windows\system32> docker-machine create --driver hyperv --hyperv-memory $HYPERV_MEMORY --hyperv-cpu-count $HYPERV_CPU_COUNT  CB-HYPERV2
Running pre-create checks...
Creating machine...
(CB-HYPERV3) Copying C:\Users\Administrator\.docker\machine\cache\boot2docker.iso to C:\Users\Administrator\.docker\machine\machines\CB-HYPERV3\boot2docker.iso...
(CB-HYPERV3) Creating SSH key...
(CB-HYPERV3) Creating VM...
(CB-HYPERV3) Using switch "Primary Virtual Switch"
(CB-HYPERV3) Creating VHD
(CB-HYPERV3) Starting VM...
(CB-HYPERV3) Waiting for host to start...
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\ProgramData\chocolatey\lib\docker-machine\bin\docker-machine.exe env CB-HYPERV3
```

### :three: Rajouter un volume VHDx a une des machines
:a: D'abord creer la machine virtuel avec les valeurs par defauts avec `powershell`

```
docker-machine create --driver hyperv CB-HYPERV3
```
* Lancer la commande suivante pour verifier le volume des diques existantes sur la machine et leurs `Paths`
```
Get-VM -VMName CB-HYPERV3 | Select-Object VMId | Get-VHD | `
>> Format-List Path,VhdFormat,VhdType,Size


Path      : C:\Users\Administrator\.docker\machine\machines\CB-HYPERV3\disk.vhd
VhdFormat : VHD
VhdType   : Dynamic
Size      : 20971520000
```

* Creer un nouvel disque virtuel utilisant la `commandlet` `New-VHD` 
```
New-VHD -SizeBytes 60GB `
>> -Path "C:\Users\Administrator\.docker\machine\machines\CB-HYPERV3-data.vhdx"


ComputerName            : WIN-H3UTITEA3H7
Path                    : C:\Users\Administrator\.docker\machine\machines\CB-HYPERV3-data.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 64424509440
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 5420BE80-A1A9-4058-B519-3CC8FAFA9447
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```

* Stoper La virtuelle machine 
```
 docker-machine stop CB-HYPERV3
Stopping "CB-HYPERV3"...
(CB-HYPERV3) Waiting for host to stop...
Machine "CB-HYPERV3" was stopped.
```

* Attacher le disque virtuel a la machine virtuelle
```
Add-VMHardDiskDrive -VMName CB-HYPERV3 `
>> -Path "C:\Users\Administrator\.docker\machine\machines\CB-HYPERV3-data.vhdx" `
>> -ControllerType IDE -ControllerNumber 0 -ControllerLocation 1
```

* Verifier que le disque est attache
```
 Get-VM -VMName CB-HYPERV3 | Select-Object VMId | Get-VHD | `
>> Format-List Path,VhdFormat,VhdType,Size


Path      : C:\Users\Administrator\.docker\machine\machines\CB-HYPERV3\disk.vhd
VhdFormat : VHD
VhdType   : Dynamic
Size      : 20971520000

Path      : C:\Users\Administrator\.docker\machine\machines\CB-HYPERV3-data.vhdx
VhdFormat : VHDX
VhdType   : Dynamic
Size      : 64424509440
```

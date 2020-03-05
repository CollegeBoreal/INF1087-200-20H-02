# Create 3 virtual machines

### 💡 :one: Regular virtual machine

```
docker-machine create --driver hyperv CB-HYPER1
```
### 💡 :two: Virtual machine with 2 CPU et 4Gb in the memory

```
PS C:\Users\Administrator> $HYPERV_MEMORY = 4096
```
```
PS C:\Users\Administrator> $HYPERV_CPU_COUNT = 2
```
```
PS C:\Users\Administrator> docker-machine create --driver hyperv --hyperv-memory $HYPERV_MEMORY --hyperv-cpu-count $HYPERV_CPU_COUNT  CB-HYPERV2
```
### 💡 :three: Virtual machine with VHDx volume 

```
docker-machine create --driver hyperv CB-HYPER2
```

#### 📌Create and prepare a new VHDX
```
PS > $vm = 'CB-HYPERV3'
```
```
PS > $VMLOC = $HOME + '\.docker\machine\machines\'
```
```
PS > New-VHD -Path "$VMLOC\$vm\$vm.vhdx" -Dynamic -SizeBytes 60GB
```
```
PS > docker-machine stop $vm
```
```
PS > ADD-VMHardDiskDrive -VMName $vm -Path "$VMLOC\$vm\$vm.vhdx"
```
```
PS > docker-machine start $vm
```
#### 📌 Se connecter à la machine virtuelle
```
PS > docker-machine ssh CB-HYPERV3
```
#### 📌Create partition table


#### 📌Attach the VHDX
```
$ sudo mkdir /mnt/sdb1
$ sudo mount /dev/sdb1 /mnt/sdb1
```
#### 📌Create a partition for the Windows files, format it, and assign it a drive letter
```
create partition primary
format quick label=vhdx
assign letter=v
```



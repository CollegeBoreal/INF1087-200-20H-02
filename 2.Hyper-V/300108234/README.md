# Create 3 virtual machines

### 💡 :one: Regular virtual machine

```
docker-machine create --driver hyperv CB-HYPER1
```
### 💡 :two: Virtual machine with VHDx volume 

```
docker-machine create --driver hyperv CB-HYPER2
```
📌open Diskpart.
```
diskpart
```
📌Create and prepare a new VHDX

```
create vdisk file=C:\windows.vhdx maximum=25600 type=fixed
```
📌Attach the VHDX
```
attach vdisk
```
📌Create a partition for the Windows files, format it, and assign it a drive letter
```
create partition primary
format quick label=vhdx
assign letter=v
```


### 💡 :three: Virtual machine with 2 CPU et 4Gb in the memory

```
PS C:\Users\Administrator> $HYPERV_MEMORY = 4096
```
```
PS C:\Users\Administrator> $HYPERV_CPU_COUNT = 2
```
```
PS C:\Users\Administrator> docker-machine create --driver hyperv --hyperv-memory $HYPERV_MEMORY --hyperv-cpu-count $HYPERV_CPU_COUNT  CB-HYPERV3
```



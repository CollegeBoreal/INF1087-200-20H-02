# Create 3 virtual machines

### 💡 :one: Regular virtual machine
```
docker-machine create --driver hyperv CB-HYPER1
```
### 💡 :two: Virtual machine with VHDx volume 


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



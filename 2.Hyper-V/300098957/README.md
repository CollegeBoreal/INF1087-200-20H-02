# 300098957


```
PS > $vm = 'CB-HYPERV'
PS > $VMLOC = $HOME + '\.docker\machine\machines\'
PS > New-VHD -Path "$VMLOC\$vm\$vm.vhdx" -Dynamic -SizeBytes 60GB
PS > docker-machine stop $vm
PS > ADD-VMHardDiskDrive -VMName $vm -Path "$VMLOC\$vm\$vm.vhdx"
PS > (Get-VMHardDiskDrive -VMName $vm).Path
PS > docker-machine start $vm
```

```
$ fdisk --list
fdisk: cannot open /dev/zram0: Permission denied
Disk /dev/sdb: 60 GiB, 64424509440 bytes, 125829120 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/sda: 19.5 GiB, 20971520000 bytes, 40960000 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: F61EC56C-A59A-2E41-B6E4-95DCB3D7A5B7

Device       Start      End  Sectors  Size Type
/dev/sda1  2050048 40959966 38909919 18.6G Linux filesystem
/dev/sda2     2048  2050047  2048000 1000M Linux swap

Partition table entries are not in disk order.
```


```
PS > get-command -module HYPERV
PS > get-command -module HYPER-V | Select-String 'VHD'
```

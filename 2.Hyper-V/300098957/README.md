# 300098957


```
PS > $vm = 'CB-HYPERV'
PS > $VMLOC = $HOME + '\.docker\machine\machines\'
PS > New-VHD -Path "$VMLOC\$vm\$vm.vhdx" -Dynamic -SizeBytes 60GB
PS > docker-machine stop $vm
PS > ADD-VMHardDiskDrive -VMName $vm -Path "$VMLOC\$vm\$vm.vhdx"
PS > Get-VMHardDiskDrive -VMName $vm
```



```
PS > get-command -module HYPERV
PS > get-command -module HYPER-V | Select-String 'VHD'
```

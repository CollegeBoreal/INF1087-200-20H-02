> Set-VMProcessor
> Set-VMProcessor CB-HYPERV1 -Count 2 -Reserve 10

 > New-VM -Name Win10VM -MemoryStartupBytes 4GB -BootDevice VHD -VHDPath .\VMs\Win10.vhdx -Path .\VMData -Generation 2 -Cpu 2

> get-vm cpu count hyper-v

> Get-VMProcessor CB-HYPERV2


> Select @{n='TotalPhysicalProcessors';e={(,( gwmi Win32_Processor)).count}}, @{n='TotalPhysicalProcessorCores'; e={ (gwmi Win32_Processor | measure -Property NumberOfLogicalProcessors -sum).sum}}, @{n='TotalVirtualCPUs'; e={ (Get-VM | Get-VMProcessor | measure -Property Count -sum).sum }}, @{n='TotalVirtualCPUsInUse'; e={ (Get-VM | Where { $_.State -eq 'Running'} | Get-VMProcessor | measure -Property Count -sum).sum }}, @{n='TotalMSVMProcessors'; e={ (gwmi -ns root\virtualization\v2 MSVM_Processor).count }}, @{n='TotalMSVMProcessorsForVMs'; e={ (gwmi -ns root\virtualization\v2 MSVM_Processor -Filter "Description='Microsoft Virtual Processor'").count }}

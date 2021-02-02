# Virtual Switch

## :zero: Create Virtual Switch


:pushpin: Visualiser vos Switch Virtuels

```
PS> Get-VMSwitch  * | Format-Table Name
```

:pushpin: Visualiser vos cartes ethernets

```
PS> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      10 Up           1C-C1-DE-F3-0D-44        10 Mbps
vEthernet (nat)           Hyper-V Virtual Ethernet Adapter             12 Up           00-15-5D-DB-3C-DE        10 Gbps
...
```

:pushpin: Creer la Switch Virtuelle pour le driver HyperV

:bulb: Le nom doit être `Primary Virtual Switch` par défaut

```
PS> $net = Get-NetAdapter -Name 'Ethernet'
PS> New-VMSwitch -Name "Primary Virtual Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```


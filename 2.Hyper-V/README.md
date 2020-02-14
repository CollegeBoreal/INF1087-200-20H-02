# Hyper V


## :o: Prérequis

:pushpin: Installer Docker-Machine

```
PS> choco install docker-machine
```

:pushpin: Installer Hyper-V

Voir [HyperV](../H.HyperV)


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

```
PS> $net = Get-NetAdapter -Name 'Ethernet'
PS> New-VMSwitch -Name "Primary Virtual Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```

## :one: Créer sa VM


```
PS> docker-machine create --driver hyperv CB-HYPERV
```


## :two: Activer sa VM

```
PS> docker-machine env CB-HYPERV | Invoke-Expression
```

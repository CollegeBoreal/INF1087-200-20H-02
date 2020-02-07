# Serveurs Windows


|:hash:| :id:      | Utilisateur à remplacer | Windows Product Name                                  | Docker Engine (opt)| 
|------|-----------|-------------------------|-------------------------------------------------------|------------------|
| 01   | 300104524 | Brice@10.13.237.19      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:|
| 02   | 300104541 | Brice@10.13.237.41      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:|
| 03   | 300106918 | Brice@10.13.237.18      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:|
| 04   | 300107361 | Brice@10.13.237.99      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:|
| 05   | 300108234 | Brice@10.13.237.55      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:|
| 06   | 300110500 | Brice@10.13.237.75      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:|
| 07   | 300110529 | Brice@10.13.237.80      |:x: |:x:     |
| 08   | 300111671 | Brice@10.13.237.63      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:            |
| 09   | 300111766 | Brice@10.13.237.66      |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:x:                           |
| 10   | 300112017 | Brice@10.13.237.60      |:heavy_check_mark: Windows Server 2019 Datacente :desktop_computer: :key: |:x:                           |
| 11   | 300112917 | Brice@10.13.237.79      |:heavy_check_mark: Hyper-V Server 2019                 |:x:                           |
| 12   | 300113775 | Brice@10.13.237.77      |:heavy_check_mark: Hyper-V Server 2019                 |:x:                           |
|      |           |                         |                                                       |                              |
| 0A   |           | Brice@10.13.237.4       |:heavy_check_mark: Windows Server 2019 Datacenter :key:|:heavy_check_mark:            |
| 0B   |           | Brice@10.13.5.47        |:heavy_check_mark: Hyper-V Server 2019                 |:x:                           |


# Vérification Prof

Sous @PowerShell

#### :one: Entrer la commande ci-dessous, 

* Taper Enter et Donner `B0r34l$` comme mot de passe

```
PS > $Password = Read-Host -AsSecureString 
```

#### :two: Créer l'utilisateur

```
PS > New-LocalUser "Brice" -Password $Password -FullName "Brice" -Description "Prof. "
```

#### :three: Donner les droits administrateurs à l'utilisateur

```
PS > Add-LocalGroupMember -Group "Administrators" -Member "Brice"
```

#### :o: Verification


```
PS > Get-LocalGroupMember -Group "Administrators"

ObjectClass Name                   PrincipalSource
----------- ----                   ---------------
User        <SERVEUR>\Administrator Local
User        <SERVEUR>\Brice         Local
```


```
PS > Get-ComputerInfo -Property WindowsProductName, OsServerLevel
WindowsProductName             OsServerLevel
------------------             -------------
Windows Server 2019 Datacenter    ServerCore
```


```
PS C:\> Get-ComputerInfo -Property Windows*, Hyper*


WindowsBuildLabEx                                 : 17763.1.amd64fre.rs5_release.180914-1434
WindowsCurrentVersion                             : 6.3
WindowsEditionId                                  : ServerDatacenterACor
WindowsInstallationType                           : Server Core
WindowsInstallDateFromRegistry                    : 1/11/2020 5:24:35 AM
WindowsProductId                                  : 00000-00000-00000-00000
WindowsProductName                                : Windows Server Datacenter
WindowsRegisteredOrganization                     :
WindowsRegisteredOwner                            :
WindowsSystemRoot                                 : C:\Windows
WindowsVersion                                    : 1809
HyperVisorPresent                                 : False
HyperVRequirementDataExecutionPreventionAvailable : True
HyperVRequirementSecondLevelAddressTranslation    : True
HyperVRequirementVirtualizationFirmwareEnabled    : True
HyperVRequirementVMMonitorModeExtensions          : True
```

# Références

https://pureinfotech.com/create-new-user-account-powershell-windows-10/

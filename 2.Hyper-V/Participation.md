# [VMs sur Serveurs Windows](https://github.com/CollegeBoreal/INF1087-200-20H-02/blob/master/1.Windows/Participation.md)

|:hash:| :id:      | VM1                 | VM2                | VM3                 | 
|------|-----------|---------------------|--------------------|---------------------|
| 01   | 300104524 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 02   | 300104541 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 03   | 300106918 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 04   | 300107361 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 05   | 300108234 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 06   | 300110500 | :heavy_check_mark:  | :+1: |  :heavy_check_mark: |
| 07   | 300110529 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 08   | 300111671 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 09   | 300111766 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 10   | 300112017 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 11   | 300112917 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |
| 12   | 300113775 | :heavy_check_mark:  | :heavy_check_mark: |  :x: |


# Corrections

:one: Pointer le `storage-path` avec la variable d'environnement `$Env:MACHINE_STORAGE_PATH`

```
PS > $Env:MACHINE_STORAGE_PATH = "C:\Users\Administrator\.docker\machine"
```

## CB-HYPERV

:two: Guarder le numéro d'étudiant (i.e. penser `docker-compose` )

```
PS> docker-machine env CB-HYPERV | Invoke-Expression
PS > $Env:ID="300098957"
PS > cd C:\Users\Administrator\Developer\INF1087-200-20H-02\2.Hyper-V\$Env:ID
PS > docker-compose ps
      Name                     Command               State                  Ports
-----------------------------------------------------------------------------------------------
300107361_db_1      docker-entrypoint.sh --def ...   Up       0.0.0.0:3306->3306/tcp, 33060/tcp
300107361_pma_1     /docker-entrypoint.sh apac ...   Up       0.0.0.0:8080->80/tcp
300107361_wp_1      docker-entrypoint.sh apach ...   Up       0.0.0.0:80->80/tcp
300107361_wpcli_1   docker-entrypoint.sh wp shell    Exit 1
```

## CB-HYPERV:two: 

:three: VM Size

```
PS > docker-machine inspect CB-HYPERV2 --format='{{json .Driver.CPU}} {{json .Driver.MemSize}}'
2 4096
```

## CB-HYPERV:three: 

:four: Check VM size through mounted VHDx disk

* docker Connect to the VM - pour test direct

```
PS > docker-machine env CB-HYPERV3 | Invoke-Expression
```

* Check Container volume through the container `some-mysqlds` (if no ssh)

```
PS > docker container exec --interactive --tty some-mysqlds sh -c "ls /var/lib/mysql-files"
lost+found
```

* Check `/dev/sdb1` volume through the container `some-mysqlds`

```
PS > docker container exec --interactive --tty some-mysqlds sh -c "df -h | grep sdb"
/dev/sdb1        59G   53M   56G   1% /var/lib/mysql-files
```

:x: Other alternatives less points

* SSH Connect to the VM - pour test alternatif

```
PS > docker-machine ssh CB-HYPERV3
```

Check its 2nd disk size - 62914560 = 60GiB

```
$ fdisk -s  /dev/sdb
62914560
```

PowerShell chmod 400

https://gist.github.com/jaskiratr/cfacb332bfdff2f63f535db7efb6df93

```
# Source: https://stackoverflow.com/a/43317244
$path = ".\id_rsa"
# Reset to remove explict permissions
icacls.exe $path /reset
# Give current user explicit read-permission
icacls.exe $path /GRANT:R "$($env:USERNAME):(R)"
# Disable inheritance and remove inherited permissions
icacls.exe $path /inheritance:r
```



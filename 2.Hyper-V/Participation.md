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

:two: Guarder le numéro d'étudiant (i.e. penser `docker-compose` )

```
PS > $Env:ID="300098957"
PS > cd $Env:ID
```

## CB-HYPERV:two: 

```
PS > docker-machine inspect CB-HYPERV2 --format='{{json .Driver.CPU}} {{json .Driver.MemSize}}'
```

## CB-HYPERV:two: 

* docker Connect to the VM

```
PS > docker-machine env CB-HYPERV3 | Invoke-Expression
```

* Check `/dev/sdb1` volume through the container `some-mysqlds`

```
PS > docker container exec --interactive --tty some-mysqlds sh -c "df -h | grep sdb"
/dev/sdb1        59G   53M   56G   1% /var/lib/mysql-files
```


* SSH Connect to the VM

```
PS > docker-machine ssh CB-HYPERV3
```

Check its 2nd disk size - 62914560 = 60GiB

```
$ fdisk -s  /dev/sdb
62914560
```


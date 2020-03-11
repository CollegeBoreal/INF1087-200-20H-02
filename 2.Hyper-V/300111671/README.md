

## :m: CB-HYPERV2

### :one: Créer le disque virtuel

:bulb: Pour ajouter le disque à la machine virtuelle il faut l'arreter et ensuite la redémarrer

```
PS > $vm = 'CB-HYPERV2'
PS > $VMLOC = $HOME + '\.docker\machine\machines\'
PS > New-VHD -Path "$VMLOC\$vm\$vm.vhdx" -Dynamic -SizeBytes 60GB
PS > docker-machine stop $vm
PS > ADD-VMHardDiskDrive -VMName $vm -Path "$VMLOC\$vm\$vm.vhdx"
PS > (Get-VMHardDiskDrive -VMName $vm).Path
PS > docker-machine start $vm
```

### :two: Créer la table de partition 

:bulb: Penser à `GPT - GUID Partition Table`

:pushpin: Se connecter à la machine virtuelle

```
PS > docker-machine ssh CB-HYPERV2
```

:pushpin: Localiser le disque dans la table de partition avec l'utilitaire Linux `fdisk`

```
$ fdisk --list
fdisk: cannot open /dev/zram0: Permission denied
Disk /dev/sda: 19.5 GiB, 20971520000 bytes, 40960000 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 10A70F20-5F53-E341-8E6C-1D99192F59BF

Device       Start      End  Sectors  Size Type
/dev/sda1  2050048 40959966 38909919 18.6G Linux filesystem
/dev/sda2     2048  2050047  2048000 1000M Linux swap

Partition table entries are not in disk order.


Disk /dev/sdb: 60 GiB, 64424509440 bytes, 125829120 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0x5e9e8882

Device     Boot Start       End   Sectors Size Id Type
/dev/sdb1        2048 125829119 125827072
```

:pushpin: Créer la table de partition du nouveau disque avec l'utilitaire Linux `fdisk` 

```
$ sudo fdisk /dev/sdb

Welcome to fdisk (util-linux 2.32.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1):
First sector (2048-125829119, default 2048):
Last sector, +sectors or +size{K,M,G,T,P} (2048-125829119, default 125829119):

Created a new partition 1 of type 'Linux' and of size 60 GiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```
### :three: Formater la nouvelle partition en format Linux ext4

:pushpin: You still need to create a file system

```
$ mkfs.ext4 /dev/sdb1
mke2fs 1.44.4 (18-Aug-2018)
Found a dos partition table in /dev/sdb1
Proceed anyway? (y,N) y
Discarding device blocks: done
Creating filesystem with 15728384 4k blocks and 3932160 inodes
Filesystem UUID: 3bebf011-f169-4f52-b928-a436d0fd730e
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624, 11239424

Allocating group tables: done
Writing inode tables: done
Creating journal (65536 blocks): done
Writing superblocks and filesystem accounting information:
done
```

:pushpin: Attacher (Monter) le système de fichier à l'arborescence de fichiers

```
$ sudo mkdir /mnt/sdb1
$ sudo mount /dev/sdb1 /mnt/sdb1
```

:pushpin: S'assurer que le répertoire est visible

* Faire la liste des appareils (devices) de type `block storage`

```
$ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0  19.5G  0 disk
|-sda1   8:1    0  18.6G  0 part /mnt/sda1
`-sda2   8:2    0  1000M  0 part [SWAP]
sdb      8:16   0    60G  0 disk
`-sdb1   8:17   0    60G  0 part /mnt/sdb1
sr0     11:0    1    57M  0 rom
zram0  252:0    0 120.8M  0 disk [SWAP]
```

### :four: Créer un conteneur pour tester le volume 

:pushpin: Pointer le container engine sur la machine virtuelle

```
PS> docker-machine env CB-HYPERV | Invoke-Expression
```

:pushpin: Créer le conteneur avec le nouveau volume

```
PS > $SRC = '/mnt/sdb1'
PS > docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --volume ${SRC}:/var/lib/mysql-files `
         --detach `
         mysql/mysql-server:latest
PS > docker container exec --interactive some-mysqlds sh -c "ls /var/lib/mysql-files"
```

# References

```
PS > Get-Command -module HYPERV
PS > Get-Command -module HYPER-V | Select-String 'VHD'
PS > Get-Command -Module NetTCPIP
```

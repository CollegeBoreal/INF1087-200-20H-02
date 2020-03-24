
# Hyper V

Le but de ce laboratoire est de créer trois machines virtuelles sur une machine métale. Sur la première machine virtuelle, il faudra installer le fameux `CMS` Wordpress ansi que l’administration de MySQL sous PhpMyAdmin. Sur la deuxième machine, il faudra démontrer la création d'une machine virtuelle utilisant deux CPUs et 4Gb de mémoire. Sur la troisième machine, il faudra créer et rajouter un disque virtuel `VHDx` qui sera `monté` sur la machine virtuelle et visible dans un conteneur.

:woman_student: Le laboratoire sera noté dans la section `Hyper-V` :man_student:

:closed_book: Copiez le `README.md` dans votre répertoire et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [ ] Dans le répertoire `2.Hyper-V` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [ ] Copier les fichiers se trouvant dans le repretoire `.src` dans votre répertoire

      * incluant le fichier `docker-compose.yml` 

      * incluant le fichier `.env` 

      * incluant le repertoire `config` 

`$ cp -r .src/* `:id:` `

- [ ] Soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Dans votre Serveur Windows du laboratoire

## :star: Prérequis

- [ ] Installer Docker-Machine

```
PS> choco install docker-machine
```
- [ ] Installer Docker-Compose

```
PS> choco install docker-compose
```


- [ ] Installer Hyper-V

Voir [HyperV](../H.HyperV)

- [ ] Créer `Virtual Switch` par défaut

Voir [vSwitch](../H.HyperV/vSwitch.md)

## :m: CB-HYPERV

- [ ]  Créer une machine virtuelle

```
PS > docker-machine create `
      --driver hyperv `
      CB-HYPERV
```

:pushpin: Pointer le `container engine` sur la machine virtuelle

```
PS > docker-machine env CB-HYPERV | Invoke-Expression
```

- [ ] Cloner le cours et aller dans son répertoire de travail :id:

```
PS > git clone https://github.com/CollegeBoreal/INF1087-200-20H-02.git 
```

- [ ] Installer WordPress

```
PS > docker-compose up --detach
```

- [ ] Initialiser WordPress

:pushpin: Administrer votre site `Wordpress`

http://10.13.2.7/wp-admin
      
:pushpin: Visualiser MySQL avec PHPMyAdmin

http://10.13.2.7:8080

## :m: CB-HYPERV2

:bulb: Ajouter de la mémoire 4Gb et du CPU 2

```
PS > docker-machine create `
      --driver hyperv `
      --hyperv-cpu-count 2 `
      --hyperv-memory 4096 `
      CB-HYPERV2
```


## :m: CB-HYPERV3

- [ ] Créer le disque virtuel

:bulb: Pour ajouter le disque à la machine virtuelle il faut l'arreter et ensuite la redémarrer

```
PS > $vm = 'CB-HYPERV3'
PS > $VMLOC = $HOME + '\.docker\machine\machines\'
PS > New-VHD -Path "$VMLOC\$vm\$vm.vhdx" -Dynamic -SizeBytes 60GB
PS > docker-machine stop $vm
PS > ADD-VMHardDiskDrive -VMName $vm -Path "$VMLOC\$vm\$vm.vhdx"
PS > (Get-VMHardDiskDrive -VMName $vm).Path
PS > docker-machine start $vm
```

- [ ]  Créer la table de partition 

:bulb: Penser à `GPT - GUID Partition Table`

:pushpin: Se connecter à la machine virtuelle

```
PS > docker-machine ssh CB-HYPERV3
```

:pushpin: Localiser le disque dans la table de partition avec l'utilitaire Linux `fdisk`

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

- [ ]  Créer la table de partition du nouveau disque avec l'utilitaire Linux `fdisk` 

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
- [ ]  Formater la nouvelle partition en format Linux ext4

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

- [ ]  Attacher (Monter) le système de fichier à l'arborescence de fichiers

```
$ sudo mkdir /mnt/sdb1
$ sudo mount /dev/sdb1 /mnt/sdb1
```

- [ ]  S'assurer que le répertoire est visible

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
zram0  252:0    0 122.1M  0 disk [SWAP]
```

- [ ]  Créer un conteneur pour tester le volume 

:pushpin: Pointer le container engine sur la machine virtuelle

```
PS> docker-machine env CB-HYPERV3 | Invoke-Expression
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

## :b: Commandes utiles

## :bulb: Autres commandes pour Hyper-V module

```
PS > Get-Command -module HYPERV
PS > Get-Command -module HYPER-V | Select-String 'VHD'
PS > Get-Command -Module NetTCPIP
```

## :bulb: Desactiver toutes les machines virtuelles

```
PS > docker-machine env --unset | Invoke-Expression
```

# References


https://github.com/nezhar/wordpress-docker-compose/

https://docs.docker.com/machine/drivers/hyper-v/

http://www.theservergeeks.com/creating-multiple-vms-using-hyper-v-powershell/

https://docs.sevenbridges.com/docs/mount-a-usb-drive-in-a-docker-container

https://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/

https://www.gnu.org/software/parted/manual/html_node/mkpart.html

https://www.tecmint.com/how-to-check-disk-space-in-linux/

https://github.com/katjuell/compose-wordpress-ssl/blob/master/docker-compose.yml

http://wiki.tinycorelinux.net/

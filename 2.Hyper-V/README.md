# Hyper V

## :x: Utiliser uniquement les shells appris en cours

    Powershell et sh (incluant Bash ou zsh)

## :o: Prérequis

:pushpin: Installer Docker-Machine

```
PS> choco install docker-machine
```

:pushpin: Installer Hyper-V

Voir [HyperV](../H.HyperV)

:pushpin: Create Virtual Switch par défaut

Voir [vSwitch](../H.HyperV/vSwitch.md)

## :one: Créer sa VM

```
PS> docker-machine create --driver hyperv CB-HYPERV
```


## :two: Activer sa VM

```
PS> docker-machine env CB-HYPERV | Invoke-Expression
```

# References

https://docs.docker.com/machine/drivers/hyper-v/

http://www.theservergeeks.com/creating-multiple-vms-using-hyper-v-powershell/

https://docs.sevenbridges.com/docs/mount-a-usb-drive-in-a-docker-container

https://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/

https://www.gnu.org/software/parted/manual/html_node/mkpart.html

https://www.tecmint.com/how-to-check-disk-space-in-linux/

https://github.com/katjuell/compose-wordpress-ssl/blob/master/docker-compose.yml

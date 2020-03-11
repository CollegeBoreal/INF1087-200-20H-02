# 300104541


## :m: CB-HYPERV

:one: Creer une machine virtuelle

```
PS > docker-machine create `
      --driver hyperv `
      CB-HYPERV
```

:pushpin: pointer vers la machine virtuelle

```
PS > docker-machine env CB-HYPERV | Invoke-Expression
```

:two: Installer WordPress (`changer-mon-adresse-ip` IP dans votre fichier `.env`)

```
PS > docker-compose up --detach
```

:three: Initialiser WordPress

http://`10.13.5.57`/wp-admin
      
:pushpin: Visualiser MySQL avec PHPMyAdmin

http://`10.13.5.57`:8080

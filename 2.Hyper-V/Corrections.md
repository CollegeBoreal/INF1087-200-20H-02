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

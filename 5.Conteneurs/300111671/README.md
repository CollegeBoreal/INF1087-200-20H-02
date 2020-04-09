# :five: Conteneurs

Ce laboratoire permettra de créer une machine virtuelle sur un cloud public [GCP, Azure]

:closed_book: Copiez le `README.md` dans votre répertoire et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [ ] Dans le répertoire `5.Conteneurs` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [ ] Copier le fichier se trouvant dans le repretoire `.` dans votre répertoire

      * incluant le fichier `README.md` 


`$ cp ./README.md `:id:` `

- [ ] Soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Créer une machine virtuelle dans le cloud

- [ ] Vérifier que vos identifiants `cloud` sont installés

| Cloud  |  Google  | Azure       | AWS      |  Autres |
|--------|----------|-------------|----------|---------|
| Config | `~/.gcp` | `~/.azure`  | `~/.aws` |  ...    |

- [ ] Créer une machine virtuelle avec docker machine

```
$ docker-machine --driver <un driver cloud> <option> ma-machine-virtuelle
```

## :b: Créer une application de votre choix (docker ou docker compose)

- [x] Copie du fichier de configuration (i.e. Dockerfile, docker-compose.yml)

- [x] La commande `docker`, `docker-compose` utilisée pour lancer l'application

## :ab: Vérifier que l'application marche

:bulb: Faites attention au `firewall` de chaque nuage. Chaque nuage a sa propre configuration

- [x] Décrire la configuration du `firewall`
```

 docker-machine ls
NAME          ACTIVE   DRIVER    STATE     URL                         SWARM   DOCKER     ERRORS
cb-gcp-prod   *        google    Running   tcp://35.193.104.208:2376           v19.03.8

```

## :o: Décriver votre application et donner les accés pour la vérification 

- [x] Que fait l'application?
L'exemple lance une pile exécutant Puppet Server, PuppetDB, un conteneur PostgresDB pour PuppetDB et les tableaux de bord open source Puppetboard et Puppet Explorer

- [ ] Quel est son adresse IP?


- [ ] Quel port utilisé pour y accéder?

```
$ docker ps
CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS                         PORTS                                              NAMES
45b88f894ce1        puppet/puppetserver        "dumb-init /docker-e…"   About an hour ago   Up About an hour (healthy)     0.0.0.0:32772->8140/tcp                            puppet
2916f96ac229        puppet/puppetdb            "dumb-init /docker-e…"   About an hour ago   Up About an hour (healthy)     0.0.0.0:32770->8080/tcp, 0.0.0.0:32769->8081/tcp   300111671_puppetdb_1
d3086eb40a1b        puppet/puppetexplorer      "/usr/bin/caddy"         About an hour ago   Up About an hour               0.0.0.0:32771->80/tcp                              300111671_puppetexplorer_1
65eb0d2ba63d        puppet/puppetboard         "/bin/sh -c 'gunicor…"   About an hour ago   Up About an hour (unhealthy)   0.0.0.0:32768->8000/tcp                            300111671_puppetboard_1
707923cb1b2e        puppet/puppetdb-postgres   "docker-entrypoint.s…"   About an hour ago   Up About an hour               5432/tcp                                           postgres
```

## :star: Autres commentaires utiles à donner

- [ ] Commentaires

[Participation](Participation.md)

# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

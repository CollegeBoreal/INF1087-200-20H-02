# :five: Conteneurs

Ce laboratoire permettra de créer une machine virtuelle sur un cloud public [GCP, Azure]

:closed_book: Copiez le `README.md` dans votre répertoire et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [x] Dans le répertoire `5.Conteneurs` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [x] Copier le fichier se trouvant dans le repretoire `.` dans votre répertoire

      * incluant le fichier `README.md` 


`$ cp ./README.md `:id:` `

- [x] Soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Créer une machine virtuelle dans le cloud

- [x] Vérifier que vos identifiants `cloud` sont installés

| Cloud  |  Google  | Azure       | AWS      |  Autres |
|--------|----------|-------------|----------|---------|
| Config | `~/.gcp` | `~/.azure`  | `~/.aws` |  ...    |

- [x] Créer une machine virtuelle avec docker machine

```
 docker-machine create --driver google --google-project myvm-273714 cb-gcp-prod
Running pre-create checks...
(cb-gcp-prod) Check that the project exists
(cb-gcp-prod) Check if the instance already exists
Creating machine...
(cb-gcp-prod) Generating SSH Key
(cb-gcp-prod) Creating host...
(cb-gcp-prod) Opening firewall ports
(cb-gcp-prod) Creating instance
(cb-gcp-prod) Waiting for Instance
(cb-gcp-prod) Uploading SSH Key
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with ubuntu(systemd)...
Installing Docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\Program Files\Docker\Docker\Resources\bin\docker-machine.exe env cb-gcp-prod

```
# ajuster avec le nom de fichier identifiants

```
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/myVM-ad426b5f8268.json"

```
# Pour pointer la machine

```
eval $(docker-machine env cb-gcp-prod)

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

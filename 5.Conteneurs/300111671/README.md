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

```
~/.gcp/myVM-ad426b5f8268.json

```
- Ajouter la variable d'identifiants à son Environement

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300108234-de32988388af.json"
```

| Cloud  |  Google  | Azure       | AWS      |  Autres |
|--------|----------|-------------|----------|---------|
| Config | `~/.gcp` | `~/.azure`  | `~/.aws` |  ...    |

- [x] Créer une machine virtuelle avec docker machine

```
 docker-machine create --driver google --google-project myvm-273714 cb-gcp-abbas
Running pre-create checks...
(cb-gcp-abbas) Check that the project exists
(cb-gcp-abbas) Check if the instance already exists
Creating machine...
(cb-gcp-abbas) Generating SSH Key
(cb-gcp-abbas) Creating host...
(cb-gcp-abbas) Opening firewall ports
(cb-gcp-abbas) Creating instance
(cb-gcp-abbas) Waiting for Instance
(cb-gcp-abbas) Uploading SSH Key
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
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\Program Files\Docker\Docker\Resources\bin\docker-machine.exe env cb-gcp-abbas

```
- Pour activer la machine :

```
$  eval $(docker-machine env cb-gcp-abbas)
```
```
$ docker-machine active
```

## :b: Créer une application de votre choix (docker ou docker compose)

- [x] Copie du fichier de configuration (i.e. Dockerfile, docker-compose.yml)

- [x] La commande `docker`, `docker-compose` utilisée pour lancer l'application

- Installer WordPress

- Executer sur votre repertoire

```
LENOVO@DELUX MINGW64 ~/Developer/INF1087-200-20H-02/5.Conteneurs/300111671 (master)
```
```
$ docker-compose up --detach


```
- Initialiser WordPress

📌 Administrer le site Wordpress

http://35.193.104.208/wp-admin

📌 Visualiser MySQL avec PHPMyAdmin

http://35.193.104.208:8080


## :ab: Vérifier que l'application marche

:bulb: Faites attention au `firewall` de chaque nuage. Chaque nuage a sa propre configuration

- [x] Décrire la configuration du `firewall`


### *Pour Protocoles et ports, choisissez Protocoles et ports spécifiés et saisissez tcp: 8080,3306 dans le champ associé, où :

- 8080 est le port utilisé par WordPress.
- 3306 est le port utilisé par phpMyAdmin.



## :o: Décriver votre application et donner les accés pour la vérification 

- [x] Que fait l'application?

```

```

- [x] Quel est son adresse IP?

```
35.193.104.208
```

- [x] Quel port utilisé pour y accéder?

```
Port tcp 8080 
```

## :star: Autres commentaires utiles à donner

- [x] Commentaires

*A faire 

[Participation](Participation.md)

# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

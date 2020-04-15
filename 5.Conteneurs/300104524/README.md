# :five: Conteneurs

Ce laboratoire permettra de créer une machine virtuelle sur un cloud public [GCP, Azure]

:closed_book: Copiez le `README.md` dans votre répertoire et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [ ] Dans le répertoire `5.Conteneurs` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [ ] Copier le fichier se trouvant dans le repretoire `.` dans votre répertoire

      * incluant le fichier `README.md` 


`$ cp ./README.md `:id:` `

- [x] Soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Créer une machine virtuelle dans le cloud

- [x] Vérifier que vos identifiants `cloud` sont installés

```
 ~/.gcp/b300104524-38d76c1cec7c.json
```

- Ajouter la variable d'identifiants à son Environement

```
 export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300104524-38d76c1cec7c.json"
```

| Cloud  |  Google  | Azure       | AWS      |  Autres |
|--------|----------|-------------|----------|---------|
| Config | `~/.gcp` | `~/.azure`  | `~/.aws` |  ...    |

- [x] Créer une machine virtuelle avec docker machine

```
$docker-machine create --driver google --google-project b300104524 cb-gcp-test


$ docker-machine create --driver google --google-project b300104524 cb-gcp-test
Running pre-create checks...
(cb-gcp-test) Check that the project exists
(cb-gcp-test) Check if the instance already exists
Creating machine...
(cb-gcp-test) Generating SSH Key
(cb-gcp-test) Creating host...
(cb-gcp-test) Opening firewall ports
(cb-gcp-test) Creating instance
(cb-gcp-test) Waiting for Instance
(cb-gcp-test) Uploading SSH Key
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
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\ProgramData\chocolatey\lib\docker-machine\bin\docker-machine.exe env cb-gcp-test

```
- Activer la machine

```
$ eval $(docker-machine env cb-gcp-test)
```
```
$ docker-machine active
```

## :b: Créer une application de votre choix (docker ou docker compose)

- [x] Copie du fichier de configuration (i.e. Dockerfile, docker-compose.yml)

- [x] La commande `docker`, `docker-compose` utilisée pour lancer l'application

- Installer wordpress

```
$ docker-compose up --detach
```
- Initialiser Wordpress

📌 Administrer le site Wordpress

http://35.222.127.228/wp-admin wordpress

📌 Visualiser MySQL avec PHPMyAdmin

http://35.222.127.228:8080/ phpmyadmin


## :ab: Vérifier que l'application marche

:bulb: Faites attention au `firewall` de chaque nuage. Chaque nuage a sa propre configuration

- [x] Décrire la configuration du `firewall`

- étape à suivre:

### *Selectionez la mahine vertuelle puis cliquer sur Afficher les details du réseaux

<img src="image01.PNG"></img>


### *Cliquez sur Regles de pare-feu et choisissez la 1er regle sous le nom de docker-machine puis cliquer sur Modifier

<img src="image02.PNG"></img>

### *Pour Protocoles et ports, choisissez Protocoles et ports spécifiés et saisissez tcp: 8080,3306 dans le champ associé, où :

- 8080 est le port utilisé par WordPress.
- 3306 est le port utilisé par phpMyAdmin.

<img src="image04.PNG"></img>


## :o: Décriver votre application et donner les accés pour la vérification 

- [] Que fait l'application?

- [x] Quel est son adresse IP?

```
35.222.127.228
```
- [x] Quel port utilisé pour y accéder?

```
Port tcp 8080 
```
## :star: Autres commentaires utiles à donner

- [x] Commentaires

[Participation](Participation.md)

# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

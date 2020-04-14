# :five: Conteneurs

Ce laboratoire permettra de créer une machine virtuelle sur un cloud public [GCP, Azure]

:closed_book: Copiez le `README.md` dans votre répertoire et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

-  [✔ ] Dans le répertoire `5.Conteneurs` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [✔ ] Copier le fichier se trouvant dans le repretoire `.` dans votre répertoire

      * incluant le fichier `README.md` 


`$ cp ./README.md `:id:` `

- [✔ ] Soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Créer une machine virtuelle dans le cloud

- [✔ ] Vérifier que vos identifiants `cloud` sont installés

| Cloud  |  Google  | Azure       | AWS      |  Autres |
|--------|----------|-------------|----------|---------|
| Config | `~/.gcp` | `~/.azure`  | `~/.aws` |  ...    |

- [✔ ] Vérifier que vos identifiants cloud sont install`
```
$ ~/.gcp/b300110500-54dd5d2a1258.json
```
- [✔ ] Ajouter la variable d'identifiants à son Environement
```
$  export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300110500-54dd5d2a1258.json`
```
- [✔ ] Créer une machine virtuelle avec docker machine
```
$ docker-machine create --driver google --google-project  ma-virtuelle-machine
Running pre-create checks...
(ma-virtuelle-machine) Check that the project exists
(ma-virtuelle-machine) Check if the instance already exists
Creating machine...
(ma-virtuelle-machine) Generating SSH Key
(ma-virtuelle-machine) Creating host...
(ma-virtuelle-machine) Opening firewall ports
(ma-virtuelle-machine) Creating instance
(ma-virtuelle-machine) Waiting for Instance
(ma-virtuelle-machine) Uploading SSH Key
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

```

## :b: Créer une application de votre choix (docker ou docker compose)

- [✔ ] Copie du fichier de configuration (i.e. Dockerfile, docker-compose.yml)

- [✔ ] La commande `docker`, `docker-compose` utilisée pour lancer l'application

```
 docker-compose up --detach
The DB_NAME variable is not set. Defaulting to a blank string.
The DB_ROOT_PASSWORD variable is not set. Defaulting to a blank string.
Creating network "gcp_default" with the default driver
Creating volume "gcp_db_data" with default driver
Pulling db (mysql:latest)...
latest: Pulling from library/mysql
Digest: sha256:b69d0b62d02ee1eba8c7aeb32eba1bb678b6cfa4ccfb211a5d7931c7755dc4a8
Status: Downloaded newer image for mysql:latest
Pulling pma (phpmyadmin/phpmyadmin:)...
latest: Pulling from phpmyadmin/phpmyadmin
Digest: sha256:59912efb52a5b0342b3defc890a7041ab2a32dc2f5c9a014150006db8c55a793
Status: Downloaded newer image for phpmyadmin/phpmyadmin:latest
Pulling wp (wordpress:latest)...
latest: Pulling from library/wordpress
Digest: sha256:191d5caf4ef5b8c57721ade777820f3267654325f7902b2ccd377ceeba1c3fe2
Status: Downloaded newer image for wordpress:latest
Pulling wpcli (wordpress:cli)...
cli: Pulling from library/wordpress
Digest: sha256:9f165c3679042257f7c7905b0cb9491b1d3e37d78590f2b52235a968212c3f71
Status: Downloaded newer image for wordpress:cli
Creating gcp_db_1 ... done
Creating gcp_wp_1  ... done
Creating gcp_pma_1   ... done
Creating gcp_wpcli_1 ... done
```
## :ab: Vérifier que l'application marche

:bulb: Faites attention au `firewall` de chaque nuage. Chaque nuage a sa propre configuration

- [✔ ] Décrire la configuration du `firewall`

## :o: Décriver votre application et donner les accés pour la vérification 

- [✔ ] Que fait l'application?
```
- [✔ ] Quel est son adresse IP?
```
http://35.223.212.123/wp-admin/
```
- [✔ ] MYSQL et PHP  `admin`
````
   http://35.223.212.123:8080
    ```
- [✔ ] Décrire la configuration du `firewall` 
```
- [✔ ] Quel port utilisé pour y accéder?
`Port tcp: 8080
                    
## :star: Autres commentaires utiles à donner

- [ ] Commentaires

[Participation](Participation.md)

# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

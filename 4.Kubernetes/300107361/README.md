# Kubernetes

Ce laboratoire permettra de créer une grappe (cluster) Kubernetes sur GCP (Google Cloud Platform).

:closed_book: Copiez le `README.md` dans votre répertoire et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [x] Dans le répertoire `4.Kubernetes` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [x] Copier le fichier se trouvant dans le repretoire `.` dans votre répertoire

      * incluant le fichier `README.md` 


`$ cp ./README.md `:id:` `

- [x] Soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Dans votre Serveur Windows du laboratoire

## :star: Prérequis

Etapes: 

- [x]  Ouvrir son compte GCP

- [x]  Configurer son environnement GCP

```
C:\Users\Tochgaly-K.J.Etienne\AppData\Local\Google\Cloud SDK>gcloud init
Welcome! This command will take you through the configuration of gcloud.

Settings from your current configuration [default] are:
accessibility:
  screen_reader: 'true'
core:
  account: etiennetochgaly@gmail.com
  disable_usage_reporting: 'True'
  project: my-college-project-273006
```

- [x]  Créer sa première VM avec GCP

```
PS C:\Users\Tochgaly-K.J.Etienne\Downloads> docker-machine create --driver google --google-project my-college-project-273006 cb-gcp-test
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

- [ ]  Créer son premier cluster Kubernetes avec GCP

## GCP

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/4.Cloud/2.Public/4.GCP

## References

https://kube.academy/

| Titre | Description |
|-------|-------------|
| [Docker In Action](https://www.manning.com/books/docker-in-action-second-edition) | [Chapitre 1](https://livebook.manning.com/book/kubernetes-in-action/chapter-1) |



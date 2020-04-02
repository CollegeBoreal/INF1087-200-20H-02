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
  
  Pick configuration to use:
 [1] Re-initialize this configuration [default] with new settings
 [2] Create a new configuration
Please enter your numeric choice:  1

Your current configuration has been set to: [default]

You can skip diagnostics next time by using the following flag:
  gcloud init --skip-diagnostics

Network diagnostic detects and fixes local network connection issues.
Checking network connection...done.
Reachability Check passed.
Network diagnostic passed (1/1 checks passed).

Choose the account you would like to use to perform operations for
this configuration:
 [1] etiennetochgaly@gmail.com
 [2] Log in with a new account
Please enter your numeric choice:  1

You are logged in as: [etiennetochgaly@gmail.com].

Pick cloud project to use:
 [1] my-college-project-273006
 [2] poised-ceiling-260607
 [3] Create a new project
Please enter numeric choice or text value (must exactly match list
item):  1

Your current project has been set to: [my-college-project-273006].

Do you want to configure a default Compute Region and Zone? (Y/n)?  y

Which Google Compute Engine zone would you like to use as project
default?
If you do not specify a zone via a command line flag while working
with Compute Engine resources, the default is assumed.
 [1] us-east1-b
 [2] us-east1-c
 [3] us-east1-d
 [4] us-east4-c
 [5] us-east4-b
 [6] us-east4-a
 [7] us-central1-c
 [8] us-central1-a
 [9] us-central1-f
 [10] us-central1-b
Did not print [58] options.
Too many options [68]. Enter "list" at prompt to print choices fully.
Please enter numeric choice or text value (must exactly match list
item):  us-central1-a

Your project default Compute Engine zone has been set to [us-central1-a].
You can change it by running [gcloud config set compute/zone NAME].

Your project default Compute Engine region has been set to [us-central1].
You can change it by running [gcloud config set compute/region NAME].

Your Google Cloud SDK is configured and ready to use!

* Commands that require authentication will use etiennetochgaly@gmail.com by default
* Commands will reference project `my-college-project-273006` by default
* Compute Engine commands will use region `us-central1` by default
* Compute Engine commands will use zone `us-central1-a` by default

Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [default]. You can create additional configurations if you work with multiple accounts and/or projects.
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic --help` to learn about advanced features of the SDK like arg files and output formatting
```

:b: `gcp CLI`

```
C:\Users\Tochgaly-K.J.Etienne\AppData\Local\Google\Cloud SDK>gcloud beta compute ssh --zone us-central1-a cb-gcp-test --project my-college-project-273006
You do not currently have this command group installed.  Using it
requires the installation of components: [beta]

Restarting command:
  $ gcloud components install beta

Installing component in a new window.

Please re-run this command when installation is complete.
    $ gcloud beta compute ssh --zone us-central1-a cb-gcp-test --project my-college-project-273006
```

While in the new window

```
Your current Cloud SDK version is: 287.0.0
Installing components from version: 287.0.0

 ---------------------------------------------
|     These components will be installed.     |
 ---------------------- ------------ ---------
|         Name         |  Version   |   Size  |
 ---------------------- ------------ ---------
| gcloud Beta Commands | 2019.05.17 | < 1 MiB |
 ---------------------- ------------ ---------

For the latest full release notes, please visit:
  https://cloud.google.com/sdk/release_notes

Do you want to continue (Y/n)?  Y

Creating update staging area
10%
20%
30%
35%
40%
45%
50%
55%
60%
65%
70%
75%
80%
85%
90%
95%
100%
100%
100%
Installing: gcloud Beta Commands
50%
62%
75%
88%
100%
100%
100%
Creating backup and activating new installation
50%
100%
100%

Performing post processing steps...done.

Update done!

Press any key to continue . . .
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
:b: Connexion a la VM
```
Using username "Tochgaly-K.J.Etienne".
Authenticating with public key "LAPTOP-1Q5O20OP\Tochgaly-K.J.Etienne@LAPTOP-1Q5O20OP"
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.10.0-27-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

249 packages can be updated.
157 updates are security updates.

New release '18.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Tochgaly-K.J.Etienne@cb-gcp-test:~$
```
https://github.com/CollegeBoreal/INF1087-200-20H-02/blob/master/4.Kubernetes/300107361/gcp.PNG?raw=true

- [ ]  Créer son premier cluster Kubernetes avec GCP

## GCP

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/4.Cloud/2.Public/4.GCP

## References

https://kube.academy/

| Titre | Description |
|-------|-------------|
| [Docker In Action](https://www.manning.com/books/docker-in-action-second-edition) | [Chapitre 1](https://livebook.manning.com/book/kubernetes-in-action/chapter-1) |



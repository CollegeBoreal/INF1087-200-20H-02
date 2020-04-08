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

gcloud init
Welcome! This command will take you through the configuration of gcloud.

Your current configuration has been set to: [default]

You can skip diagnostics next time by using the following flag:
  gcloud init --skip-diagnostics

Network diagnostic detects and fixes local network connection issues.
Checking network connection...done.
Reachability Check passed.
Network diagnostic passed (1/1 checks passed).

You must log in to continue. Would you like to log in (Y/n)?  y

Your browser has been opened to visit:

    https://accounts.google.com/o/oauth2/auth?code_challenge=Q4bz6bj6vAsh08xx4nYSorooOlPjTWsruvn9faFSv8w&prompt=select_account&code_challenge_method=S256&access_type=offline&redirect_uri=http%3A%2F%2Flocalhost%3A8085%2F&response_type=code&client_id=32555940559.apps.googleusercontent.com&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fappengine.admin+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcompute+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth




Updates are available for some Cloud SDK components.  To install them,
please run:
  $ gcloud components update

You are logged in as: [aladeabbas@gmail.com].

Pick cloud project to use:
 [1] b300111671
 [2] dazzling-task-253420
 [3] Create a new project
Please enter numeric choice or text value (must exactly match list
item):  1

Your current project has been set to: [b300111671].

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
 [11] us-west1-b
 [12] us-west1-c
 [13] us-west1-a
 [14] europe-west4-a
 [15] europe-west4-b
 [16] europe-west4-c
 [17] europe-west1-b
 [18] europe-west1-d
 [19] europe-west1-c
 [20] europe-west3-c
 [21] europe-west3-a
 [22] europe-west3-b
 [23] europe-west2-c
 [24] europe-west2-b
 [25] europe-west2-a
 [26] asia-east1-b
 [27] asia-east1-a
 [28] asia-east1-c
 
 ```

- [x]  Créer sa première VM avec GCP

- [x]  Créer son premier cluster Kubernetes avec GCP

```
$ gcloud container clusters create kubia --num-nodes 3 --machine-type f1-micro --zone "us-central1-a"

```

```
WARNING: Currently VPC-native is not the default mode during cluster creation. In the future, this will become the default mode and can be disabled using `--no-enable-ip-alias` flag. Use `--[no-]enable-ip-alias` flag to suppress this warning.
WARNING: Newly created clusters and node-pools will have node auto-upgrade enabled by default. This can be disabled using the `--no-enable-autoupgrade` flag.
WARNING: Starting with version 1.18, clusters will have shielded GKE nodes by default.
WARNING: Your Pod address range (`--cluster-ipv4-cidr`) can accommodate at most 1008 node(s).
This will enable the autorepair feature for nodes. Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair for more information on node autorepairs.
Creating cluster kubia in us-central1-a... Cluster is being health-checked (master is healthy)...done.
Created [https://container.googleapis.com/v1/projects/b300111671/zones/us-central1-a/clusters/kubia].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1-a/kubia?project=b300111671
kubeconfig entry generated for kubia.
NAME   LOCATION       MASTER_VERSION  MASTER_IP     MACHINE_TYPE  NODE_VERSION    NUM_NODES  STATUS
kubia  us-central1-a  1.14.10-gke.27  34.69.46.216  f1-micro      1.14.10-gke.27  3          RUNNING

```
```
$ gcloud projects list

PROJECT_ID            NAME              PROJECT_NUMBER
b300111671            b300111671        587530552655
dazzling-task-253420  My First Project  114322338984

```


# verification des 3 nodes

```

NAME                                   STATUS     ROLES    AGE    VERSION
gke-kubia-default-pool-6d345001-b282   NotReady   <none>   8m6s   v1.14.10-gke.27
gke-kubia-default-pool-6d345001-knvv   NotReady   <none>   8m6s   v1.14.10-gke.27
gke-kubia-default-pool-6d345001-t1m6   NotReady   <none>   8m6s   v1.14.10-gke.27

```
:round_pushpin: Décrire un des noeuds avec la commande `describe` 


```

Name:               gke-kubia-default-pool-6d345001-b282
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/fluentd-ds-ready=true
                    beta.kubernetes.io/instance-type=f1-micro
                    beta.kubernetes.io/os=linux
                    cloud.google.com/gke-nodepool=default-pool
                    cloud.google.com/gke-os-distribution=cos
                    failure-domain.beta.kubernetes.io/region=us-central1
                    failure-domain.beta.kubernetes.io/zone=us-central1-a
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=gke-kubia-default-pool-6d345001-b282
                    kubernetes.io/os=linux
Annotations:        container.googleapis.com/instance_id: 1773774285117134726
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Tue, 07 Apr 2020 12:26:56 -0400
Taints:             node.kubernetes.io/unreachable:NoSchedule
Unschedulable:      false
Conditions:
  Type                          Status    LastHeartbeatTime                 LastTransitionTime                Reason                          Message
  ----                          ------    -----------------                 ------------------                ------                          -------
  ReadonlyFilesystem            False     Tue, 07 Apr 2020 12:42:25 -0400   Tue, 07 Apr 2020 12:27:04 -0400   FilesystemIsNotReadOnly         Filesystem is not read-only
  CorruptDockerOverlay2         False     Tue, 07 Apr 2020 12:42:25 -0400   Tue, 07 Apr 2020 12:27:04 -0400   NoCorruptDockerOverlay2         docker overlay2 is functioning properly
  
  ```
  




## References

https://kube.academy/

| Titre | Description |
|-------|-------------|
| [Docker In Action](https://www.manning.com/books/docker-in-action-second-edition) | [Chapitre 1](https://livebook.manning.com/book/kubernetes-in-action/chapter-1) |



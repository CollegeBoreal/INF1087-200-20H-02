5️⃣ Conteneurs
Ce laboratoire permettra de créer une machine virtuelle sur un cloud public [GCP, Azure]

📕 Copiez le README.md dans votre répertoire et cocher les sections - [x] au fur et à mesure de votre progression.

⭕ Sur votre PC, créer votre répertoire de travail dans git bash
 Dans le répertoire 5.Conteneurs Créer un répertoire avec comme nom, votre 🆔
$ mkdir 🆔

 Copier le fichier se trouvant dans le repretoire . dans votre répertoire

* incluant le fichier `README.md` 
$ cp ./README.md 🆔

 Soumettre votre répertoire de travail vers github (git add, commit, push)
🅰️ Créer une machine virtuelle dans le cloud
 Vérifier que vos identifiants cloud sont installés
Cloud	Google	Azure	AWS	Autres
Config	~/.gcp	~/.azure	~/.aws	...
 Créer une machine virtuelle avec docker machine
$ docker-machine --driver <un driver cloud> <option> ma-machine-virtuelle
🅱️ Créer une application de votre choix (docker ou docker compose)
 Copie du fichier de configuration (i.e. Dockerfile, docker-compose.yml)

 La commande docker, docker-compose utilisée pour lancer l'application

🆎 Vérifier que l'application marche
💡 Faites attention au firewall de chaque nuage. Chaque nuage a sa propre configuration

 Décrire la configuration du firewall
⭕ Décriver votre application et donner les accés pour la vérification
 Que fait l'application?

 Quel est son adresse IP?

 Quel port utilisé pour y accéder?

⭐ Autres commentaires utiles à donner
 Commentaires
Participation

Références
https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

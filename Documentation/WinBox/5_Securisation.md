---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide de la sécurisation d'un équipement Mikrotik </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Globale
```
```

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Sécurisation d'un équipement Mikrotik
#### X. Log
Menu de sélection `Log` permet de voir les événements. Ce menu est très important car il permet de comprendre les flux. (Il faut activer la log sur chaque flux et définir un Préfix) 

<br />

#### X. Mot de passe du routeur
Menu de sélection `System` > `Password`.

#### X. Users
Menu de sélection `System` > `Users`. Ce menu permet la gestion des utilisateurs, Groupes, authentification par clé SSH et les utilisateurs actifs.
```
1) Modifier la politique de mot de passe via Settings.
2) Création de Groupe avec des privilèges
3) Création d'un utilisateur.
4) Attribuer un groupe à l'utilisateur
5) Filtrer l'accès au routeur par filtrage IP ou par réseau
7) Modifier le mot de passe du compte admin
8) Rétrograder les droits aux compte admin
9) Désactiver le Compte
10) Importer les clés SSH et liée à un utilisateur
```


#### X. Services
Menu de sélection `IP` > `Services`. On désactive tout service du routeur qu'on utilise pas pour diminuer le vecteur d'attaque.

Chaque service peut avoir un filtrage par IP ou par réseau ce qui permet de diminuer le vecteur d'attaque.

On peut changer le port par défaut de chaque service .
```
API     : OFF
API-SSL : OFF
FTP     : ON (Conditionnel) - Permet le transfert de fichier entre l'administrateur et le routeur. (Backup, Config ....)
SSH     : ON (Conditionnel)
Telnet  : OFF
Winbox  : ON (Conditionnel)
www     : ON
www-ssl : OFF (Requiert un certificat)
```


#### X. Mac Server
Menu de sélection `Tools` > `Mac Server`. Mac Server permet l'authentification via l'adresse MAC ce qui contourne la protection d'authentification par IP.
```
Mac Telnet Server : NONE
MAC WinBox Server : NONE (A peaufiner)
```

#### X. 
Menu de sélection ``

#### X. 
Menu de sélection ``

#### X. 
Menu de sélection ``

#### X. 
Menu de sélection ``

#### X. 
Menu de sélection ``

#### X. 
Menu de sélection ``

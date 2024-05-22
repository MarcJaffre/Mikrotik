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
Mac Telnet Server : OFF
MAC WinBox Server : OFF - A Peaufiner
Mac Ping Server   : OFF
```

<br />
<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Routeur en HTTPS
#### A. Création d'une autorité de certification et d'un certificat
#### 1. Création du Certificat
Menu de sélection `System` > `Certificates` > `+`.

![General](https://github.com/Drthrax74/Mikrotik/assets/35907/cdc8aaaf-f348-423e-bb96-1a51fbff21ed)

<br />

![Key Usage](https://github.com/Drthrax74/Mikrotik/assets/35907/84ea686b-b8a1-4919-8a56-3c59eb22b2ae)

#### 2. Signer le certificat
Menu de sélection `System` > `Certificates` > `RootCA` > `Sign` > `Certificate: RootCA` > `Start`.

![Sign - Done](https://github.com/Drthrax74/Mikrotik/assets/35907/e0386b4a-dcd1-41ae-9411-d12f7751e2bf)

![Certificates - Resultat](https://github.com/Drthrax74/Mikrotik/assets/35907/abcba415-a44d-4a1e-91c8-efbc3607d0e4)

<br />

#### 3. Création d'un certificat SSL (Routeur)
Menu de sélection `System` > `Certificates` > `+`.

![General](https://github.com/Drthrax74/Mikrotik/assets/35907/8845c568-949e-45f5-9615-b02a294108d0)

<br /> 

![Key Usage](https://github.com/Drthrax74/Mikrotik/assets/35907/0d8f74ae-39ab-4b91-856f-bbe9146020d2)

<br />

![Sign - Certificat with CA](https://github.com/Drthrax74/Mikrotik/assets/35907/9e81832c-6c5b-496d-81f9-4ef7ba0cf3e3)

#### 4. Appliquer le certificat au service
Menu de sélection `IP` > `Services` > `www-ssl`.

![IP Service www-SSL](https://github.com/Drthrax74/Mikrotik/assets/35907/d2ae5f94-c2ee-4db6-9bb8-f65c00e02397)

<br />

![???](https://github.com/Drthrax74/Mikrotik/assets/35907/ccff82a7-9d60-46af-8122-6c81795dbafc)

#### 5. Test de fonctionnement
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/30689728-6846-45c0-8e79-712f1a10da6c)

<br />


#### 6. Exporter les certificates
Séléctionner un certificat puis Export.


<br />
<br />



#### B. Création d'une autorité de certification et d'un certificat (Terminal)
##### 1. Autorité de certification
Menu de sélection `New Terminal`
```bash
certificate add name=RootCA common-name=RootCA key-usage=key-cert-sign,crl-sign
certificate sign RootCA
```
##### 2. Certificat
Menu de sélection `New Terminal`
```
certificate add name=Certificat_WAN common-name=192.168.200.50
certificate sign Certificat_WAN ca=RootCA
```

<br />
<br />


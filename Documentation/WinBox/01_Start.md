------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik avec une interface WAN et LAN </p>
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

<br />

### I. Présentation
#### A. Réseaux
```
- Routeur:
 - LAN: 192.168.200.1/24

- Mikrotik:
 - WAN: 192.168.200.50/24
 - LAN: 192.168.220.1/24
 - DMZ: 192.168.240.1/24
```

```
https://www.youtube.com/watch?v=TPQ0Mv69M_w
```

#### B. Outil de configuration
Il faut télécharger WinBox pour permettre de découvrir l'équipement Microtik qui est pas configuré. (Connexion par Mac Address)

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configuration de base
#### A. Définir le nom de l'équipement
Menu de sélection `System` > `Identity`

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/ec02cb7f-cb1b-4eae-af54-76cc15345f2b' />

<br />
<br />

#### B. Définir le nom des interfaces réseaux
Menu de sélection `Interfaces` > `EtherX` > `Name: XXXX` > `Apply` .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/4d89fff0-8dd1-4ec6-96d9-4088b0bc8bf4' />

<br />
<br />

#### C. Définir le serveur DNS du routeur
Menu de sélection `IP` > `DNS`.

Dans le champs `Servers` indiquer les serveurs DNS.

Pour ajouter un autre serveur DNS, il suffit de faire la flèche vers le bas à droite de `Servers`

**Allow Remote Requests** doit être COCHER pour permettre au routeur de répondre au dequête DNS qu'il reçois.

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/dc7aec51-ba1e-4a0d-a0a7-cdf4e2decc95' />

<br />

#### D. License
##### 1. Limitation
L'image CHR de Mikrotik est totalement gratuite, mais requiert une activation via un compte Mikrotik pour bénéficier de toutes ses fonctions et aussi de lever ses limitations. (bande passante par exemple)

##### 2. Inscription
Il est nécessaire de s'enregistrer sur le site de mikrotik

##### 3. Activation du routeur
Menu de sélection > `System` > `License` > `Renew License` .

##### 4. Tableau de limitation sans licence

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/666e9a9a-293e-4270-ac85-ce082efaef28)








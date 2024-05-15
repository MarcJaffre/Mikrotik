------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik avec 2 interfaces </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Information
Le routeur Mikrotik disposera de 2 carte réseaux.

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configuration de base
#### A. Définir le nom de l'équipement
Menu de sélection `System` > `Identity`

<p align='center'> <img src='https://github.com/Drthrax74/Mikrotik/assets/35907/10b708bb-2623-40cf-98de-2f8405616958)' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Mikrotik/assets/35907/ec02cb7f-cb1b-4eae-af54-76cc15345f2b' /> </p>

#### B. Définir le nom des interfaces réseaux
Menu de sélection `Interfaces` > `sélectionner l'interface` et `changer le nom`> `Apply` .

<p align='center'> <img src='https://github.com/Drthrax74/Mikrotik/assets/35907/633167b0-2ea0-4bbd-b263-a9b93bddcb3a' /> </p>

<br />

<p align='center'> <img src='https://github.com/Drthrax74/Mikrotik/assets/35907/4d89fff0-8dd1-4ec6-96d9-4088b0bc8bf4' /> </p>


#### C. Configuration des interfaces (IP)
Si un serveur DHCP est présent, il faudra éteindre l'interface avant puis la configurer.

##### 1. Accéder au menu Address List
Menu de sélection `IP` > `Addresses` > `+` .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/c8ce987f-5660-49e1-8cba-1920c8d1857b' /> 

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/a3366305-b791-4ffd-9207-1296c77c52bd' />

##### 2. Définir l'adresse IP
Le champs `Address` doit être une adresse IP en écriture CIDR. (XXX.XXX.XXX.XXX/YY)

Le champs `Interface` sert à sélectionner l'interface sur laquel on souhaite appliquer l'adresse IP.

Le champs `Network` sera remplie automatiquement si on entre correctement l'adresse CIDR précédemment. (Optionel)

**WAN**

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1cd7218e-7204-4c6e-9f54-a1938f55b17e' />

**LAN**

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/158a0573-5557-43bb-a61d-49eb13716e51' />

**Vérification Globale**

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/a6720e6d-f625-41a0-be06-faad42c4bb8f' />


#### D. Configuration de la route par défaut
Menu de sélection `IP` > `Routes` > `+` .

L'adresse `0.0.0.0/0` symbolise l'ensemble des réseaux inconnus (Internet) et la `Gateways` est l'adresse IP où on va envoyer la demande d'information.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1596da4d-652a-4f77-a760-bf49977e664e' />


#### E. Définir le serveur DNS du routeur
Menu de sélection `IP` > `DNS` .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/89de680f-015d-4670-a4ba-353c2f68892c' />

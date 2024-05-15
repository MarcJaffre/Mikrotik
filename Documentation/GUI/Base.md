------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik avec 2 interfaces </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Information
Le routeur Mikrotik disposera de 2 carte réseaux.

#### A. Réseaux
```
- Routeur:
 - LAN : 192.168.200.1

- Mikrotik:
 - WAN: 192.168.200.50/24
 - LAN: 192.168.220.1/24
```

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configuration de base
#### A. Définir le nom de l'équipement
Menu de sélection `System` > `Identity`

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/ec02cb7f-cb1b-4eae-af54-76cc15345f2b' />

<br />

#### B. Définir le nom des interfaces réseaux
Menu de sélection `Interfaces` > `EtherX` > `Name: XXXX` > `Apply` .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/4d89fff0-8dd1-4ec6-96d9-4088b0bc8bf4' />

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Configuration du WAN
Si un serveur DHCP est présent, il faudra éteindre l'interface avant puis la configurer.

#### A. Configurer l'adresse IPv4
Menu de sélection `IP` > `Addresses` > `+` .

Le champs `Address` doit être une adresse IP en écriture CIDR. (XXX.XXX.XXX.XXX/YY)

Le champs `Interface` sert à sélectionner l'interface sur laquel on souhaite appliquer l'adresse IP.

Le champs `Network` sera remplie automatiquement si on entre correctement l'adresse CIDR précédemment. (Optionel)

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1cd7218e-7204-4c6e-9f54-a1938f55b17e' />

<br />
<br />

#### B. Configuration de la route par défaut
Menu de sélection `IP` > `Routes` > `+` .

L'adresse `0.0.0.0/0` symbolise l'ensemble des réseaux inconnus (Internet) et la `Gateways` est l'adresse IP où on va envoyer la demande d'information.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1596da4d-652a-4f77-a760-bf49977e664e' />

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/7990b207-d8a0-45cf-8825-e7932c831afe' />


<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/7aae00c1-52e2-4f6f-963d-a1b5d480a359' />


#### C. Définir le serveur DNS du routeur
Menu de sélection `IP` > `DNS`.

Dans le champs `Servers` indiquer les serveurs DNS.

Pour ajouter un autre serveur DNS, il suffit de faire la flèche vers le bas à droite de `Servers`

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/c5a1af8f-5819-4fd7-9710-f81549f431da' />

<br />

#### D. Vérification du fonctionnement du routeur
Le `ping 8.8.8.8` permet de vérifier l'interconnexion et le `ping google.fr` la résolution de NOM (DNS) .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/f5f97f35-da5b-4a0e-8cb8-6e26f041a06b' />


<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Configuration du LAN
#### A. CAS 1: Sans Pont
Menu de sélection `IP` > `Addresses` > `+` .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/72056b51-7bf3-4587-bbf0-e856d303126a' />



#### B. CAS 2: Avec Pont


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik avec 2 interfaces </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation

https://www.youtube.com/watch?v=TPQ0Mv69M_w

<br />

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

**Allow Remote Requests** doit être COCHER pour permettre au routeur de répondre au dequête DNS qu'il reçois.

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/dc7aec51-ba1e-4a0d-a0a7-cdf4e2decc95' />


<br />

#### D. Vérification du fonctionnement du routeur
Le `ping 8.8.8.8` permet de vérifier l'interconnexion et le `ping google.fr` la résolution de NOM (DNS) .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/f5f97f35-da5b-4a0e-8cb8-6e26f041a06b' />


<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Configuration du LAN
#### A1. Sans Pont
Menu de sélection `IP` > `Addresses` > `+` .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/72056b51-7bf3-4587-bbf0-e856d303126a' />

#### A2. Avec Pont
##### 1. Création du Pont
Menu Sélection `Bridge` > `+` .

##### 2. Attribuer un port physique au pont
Menu Sélection `Bridge` > `Ports` > `+` et ajout un port physique.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/5c125b71-a5d5-4f70-8bc9-14db98408eb3' />

#### B. Serveur DHCP
##### 1. Création du Pool
Menu de sélection `IP` > `Pool` > `+` .

Indiquer un `Name` cohérent pour une meilleur facilité.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/69afb31d-876a-42f0-9447-8d84242ec692' />

##### 2a. DHCP Server
Menu de sélection `IP` > `DHCP Server` > `+` .

Il faut attacher l'interface au serveur DHCP , puis son Pool.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1159d745-5dbb-436f-928a-36a42e39cb77' />

<br />

Dans le cas d'une interface utilisant un pont, il faut l'attaché sur le pont.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/0b576793-1d10-4e45-81ef-950a3d8d24bf' />

<br />

##### 3. DHCP Server (Networks)
Menu de sélection `IP` > `DHCP Server` > `Networks` > `+` .


#### C. NAT (Masquerade)
Menu de sélection `IP` > `Firewall` > `NAT` > `+`. 

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/20867a8f-e62d-4481-b8c1-a939184dff95' />

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/d7519170-c70a-40a9-8238-17940894200d' />



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Test de fonctionnement
#### A. Configuration Réseau
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/1cfd8070-2b4d-484f-ae6f-3a3f34082797)

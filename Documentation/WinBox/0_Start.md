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
```

```
https://www.youtube.com/watch?v=TPQ0Mv69M_w
```

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



#### D. Configuration de la route par défaut
Menu de sélection `IP` > `Routes` > `+` .

L'adresse `0.0.0.0/0` symbolise l'ensemble des réseaux inconnus (Internet) et la `Gateways` est l'adresse IP où on va envoyer la demande d'information.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1596da4d-652a-4f77-a760-bf49977e664e' />

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/7990b207-d8a0-45cf-8825-e7932c831afe' />


<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/7aae00c1-52e2-4f6f-963d-a1b5d480a359' />


<br />
<br />

#### E. Vérification du fonctionnement du routeur
Le `ping 8.8.8.8` permet de vérifier l'interconnexion et le `ping google.fr` la résolution de NOM (DNS) .

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/f5f97f35-da5b-4a0e-8cb8-6e26f041a06b' />










------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration du WAN </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Information
Si un serveur DHCP est présent, il faudra éteindre l'interface avant puis la configurer.

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configurer l'interface WAN
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


<br />
<br />

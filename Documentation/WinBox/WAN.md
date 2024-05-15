
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

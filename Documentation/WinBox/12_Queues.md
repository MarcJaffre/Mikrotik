------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Mise en place de la Simple Queue sur un équipement Mikrotik (QoS) </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Qu'est qu'une Simple Queue
Une Simple Queue permet de définir une limitation de bande passante.

#### B. Etude de cas
Nous allons crées une Simple Queue qui déterminera la bande passante du LAN dans sa globalité.

Ensuite nous allons découper la bande passante du LAN selon le trafic ou PC.

```
bandwidthcontroller.com
```


<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Simple Queue
#### A. Pré-requis
Il est nécessaire d'avoir activer la licence sous Mikrotik pour profiter de toutes les fonctionnalités. (CHR => GRATUIT)

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/181f9222-e4bf-4e9a-b356-5df472dc78c4)


#### B. Création d'une Queue
Menu de sélection `Queues` > `Simple Queues` > `+` .
```
[General]
- Name        : LAN
- Target      : 192.168.220.0/24
- Max Limit   :
  > UPLOAD    : 5M
  > Download  : 20M
```

#### C. Création d'une Queue Enfant
Menu de sélection `Queues` > `Simple Queues` > `+` .

```
[General]
- Name        : 192.168.220.2
- Target      : 192.168.220.2/24
- Max Limit   :
  > UPLOAD    : 2M
  > Download  : 10M

[Advanced]
- Parent      : LAN
```


<br />
<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Multi Queue
Pour gérer la bande passante, il est nécessaire d'utiliser Mangle. Mangle va marquer les flux entrants et sortants pour ensuite permettre de limiter l'usage selon le protocole.

#### A. Marquer les connexions (Entrante / Sortante)
##### 1. WAN
La chaine utilisé est `Forward` sur l'interface entrante `WAN` et l'action `Mark Connection`.

![General-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/e755b123-2dd0-426e-a7b9-ad07f14be7b7)  ![Action-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/d561457a-e498-4e8a-929d-a4cb234651a8)

##### 2. LAN
La chaine utilisé est `Prerouting` sur l'interface entrant `LAN` et l'action `Mark Connection`.

![General-LAN](https://github.com/Drthrax74/Mikrotik/assets/35907/dc4557d2-e271-4dfb-926d-a370bc045c13)  ![Action-LAN](https://github.com/Drthrax74/Mikrotik/assets/35907/b3b6e04d-eb96-4573-8e56-1ca63bba0753)

<br />
<br />
<br />
<br />
<br />



#### B. Marquer les paquets (Entrante / Sortante)
##### 1. WAN
La chaine utilisé est `Forward`, la connexion marqué est `Connexions-Entrantes` et l'action `Mark Packet`.

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/e19a953e-09f2-4d86-875f-f26ee7b9c9a9)


##### 2. LAN
La chaine utilisé est `Forward`, la connexion marqué est `Connexions-sortantes` et l'action `Mark Packet`.

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/8633c463-d141-4401-a5d6-455920db9928)

<br />



#### C. Marquer un protocole
Le protocole marquer sera HTTP. On indiquer que le paquet marquer doit être contenu dans la règle spécifique en décochant la case `passthrough`.

##### 1. Entrante
HTTP utilise le protocole TCP sur le port 80. On va indiquer qu'il sera marqué en tant que Paquet entrant, toujours dans la chaine Forward.

![General-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/b3c4135b-7e6a-4e1a-806a-dd1fb93a5c31)  ![Action-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/d91790ef-f885-49f2-abe3-f7c247d8f433)

##### 1. Sortant
HTTP utilise le protocole TCP sur le port 80. On va indiquer qu'il sera marqué en tant que Paquet sortant, toujours dans la chaine Prerouting.

![General-LAN](https://github.com/Drthrax74/Mikrotik/assets/35907/f0492f1e-4197-46fa-bd03-99a5284c31f0)  ![image](https://github.com/Drthrax74/Mikrotik/assets/35907/f93fe870-fba9-40fe-8e42-006190c6b5c4)

<br />

#### D. Marquer les autres protocoles
Pour marquer les autres protocoles pour qu'il soit dans une file, il faut ajouter une règle qui servira de globale en décochant Passthrough.
##### 1. Entrants
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/c6e46820-ef93-415e-838a-d06416c7fd34)  ![image](https://github.com/Drthrax74/Mikrotik/assets/35907/e0dd8c1c-61d2-49ab-8684-211a4af8bfc3)

##### 2. Sortants
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/7e8b7b6b-cf16-481d-97e5-d4579ca5cdf2)  ![image](https://github.com/Drthrax74/Mikrotik/assets/35907/bb60c1ed-aabc-4630-b4d0-5c5e7f460f58)

<br />

#### E. Exemple de rendu (Fonctionnel !!!)
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/13b8aa65-f796-4d38-9363-19213f9b776d)

<br />
<br />

#### F. Gestion de la bande passante
Nous allons créer une nouvelle Queue qui sera la base et n'aura pas de Parent.

##### I. Queue Tree
La priorité va de 1-8, la file 1 est la plus haute en priorité alors que la 8 est la plus basse.

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/69d35952-b39d-4239-a2ba-c7c8961fda7c)

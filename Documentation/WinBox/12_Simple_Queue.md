------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Mise en place de la Simple Queue sur un équipement Mikrotik (QoS) </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Qu'est qu'une Simple Queue
Une Simple Queue permet de définir une limitation de bande passante.

#### B. Etude de cas
Nous allons crées une Simple Queue qui déterminera la bande passante du LAN dans sa globalité.

Ensuite nous allons découper la bande passante du LAN selon le trafic ou PC.



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

#### B. Marquer les paquets (Entrante / Sortante)
##### 1. WAN
La chaine utilisé est `Forward`, la connexion marqué est `Connexions-Entrantes` et l'action `Mark Packet`.

![General-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/21278eac-d80e-4226-804e-cc5e22378848)  ![Action-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/c2b16970-c855-41a9-bbb8-4e56f8f8e888)

##### 2. LAN
La chaine utilisé est `Prerouting`, la connexion marqué est `Connexions-sortantes` et l'action `Mark Packet`.

<br />

![General-LAN](https://github.com/Drthrax74/Mikrotik/assets/35907/cc1babdd-e611-44d4-aa4d-e1334e399de1)  ![Action-LAN](https://github.com/Drthrax74/Mikrotik/assets/35907/dfbeefc7-34b4-4e8c-b9a6-d17f881b8d6b)

<br />
<br />

#### C. Marquer un protocole
Le protocole marquer sera HTTP.

##### 1. Entrante
HTTP utilise le protocole TCP sur le port 80. On va indiquer qu'il sera marqué en tant que Paquet entrant, toujours dans la chaine Forward.

On décoche Passthrought pour que le trafic soit contenu dans la règle. (Evite qu'une autre Règle a le trafic)

![General-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/b3c4135b-7e6a-4e1a-806a-dd1fb93a5c31)

![Action-WAN](https://github.com/Drthrax74/Mikrotik/assets/35907/d91790ef-f885-49f2-abe3-f7c247d8f433)

##### 1. Sortant
HTTP utilise le protocole TCP sur le port 80. On va indiquer qu'il sera marqué en tant que Paquet sortant, toujours dans la chaine Prerouting.

On décoche Passthrought pour que le trafic soit contenu dans la règle. (Evite qu'une autre Règle a le trafic)

<br />



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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Multi Queue
Pour gérer la bande passante, il est nécessaire d'utiliser Mangle. Mangle va marquer les flux entrants et sortants pour ensuite permettre de limiter l'usage selon le protocole.

#### A. Paquets Entrants 
La chaine utilisé est `Forward` sur l'interface entrante `WAN` et l'action `Mark Connection`.

![General](https://github.com/Drthrax74/Mikrotik/assets/35907/1d8c271a-e38a-4ddc-a408-eaf3faec757e)

<br />

![Action](https://github.com/Drthrax74/Mikrotik/assets/35907/f944ccd7-6ccc-4860-af6d-86d1a13c75f1)

<br />

#### B. Paquets Sortants
La chaine utilisé est `Prerouting` sur l'interface entrant `LAN` et l'action `Mark Connection`.

La chaine utilisé est `Prerouting` sur l'interface entrant `DMZ` et l'action `Mark Connection`.






------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Mise en place de la Simple Queue sur un équipement Mikrotik (QoS) </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
Une Simple Queue permet de définir une limitation de bande passante.

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Simple Queue
#### A. Pré-requis
Il est nécessaire d'avoir activer la licence sous Mikrotik pour profiter de toutes les fonctionnalités. (CHR => GRATUIT)

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/181f9222-e4bf-4e9a-b356-5df472dc78c4)


#### B. Création d'une Queue
Menu de sélection `Queues` > `Simple Queues` > `+` .
```
Name        : LAN
Target      : 192.168.220.0/24
Max Limit   :
 > UPLOAD   : 200 Bits/s ou 2M
 > Download : 200 Bits/s ou 2M
```

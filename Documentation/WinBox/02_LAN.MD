------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration du LAN </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Information

<br />


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configuration du LAN
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
<br />

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/d9c66777-c8eb-4bc5-beb0-824f14b786d0)


<br />

Dans le cas d'une interface utilisant un pont, il faut l'attaché sur le pont.

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/0b576793-1d10-4e45-81ef-950a3d8d24bf' />

<br />

##### 3. DHCP Server (Networks)
Menu de sélection `IP` > `DHCP Server` > `Networks` > `+` .


![image](https://github.com/Drthrax74/Mikrotik/assets/35907/8eb9a441-8739-4a01-979d-6b77ba47b102)



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Test de fonctionnement
#### A. Configuration Réseau
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/1cfd8070-2b4d-484f-ae6f-3a3f34082797)


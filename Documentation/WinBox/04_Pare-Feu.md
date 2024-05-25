--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration du Pare-feu </p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Rappel de l'environnement
L'adresse IP WAN de l'équipement est 192.168.200.50/24 et sa passerelle est 192.168.200.1.

L'adresse IP LAN de l'équipement est 192.168.220.1/24.

Toute requête sur un réseau inconnu va sur la passerelle 192.168.200.1.

<br />


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Internet
Pour permettre l'accès à internet, il faut créer une règle NAT. La règle est de type sortante, sur le port WAN et l'IP publique (IP WAN) sera celle utilisé dans le cas présent.

#### A. Création d'une Règle NAT Globale
Menu de sélection `IP` > `Firewall` > `NAT` > `+`. La règle suivante permet à l'ensemble des réseaux locaux d'avoir internet. (Tout les ports sortant sont ouverts)

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/20867a8f-e62d-4481-b8c1-a939184dff95' />

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/d7519170-c70a-40a9-8238-17940894200d' />

<br />


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Filter Rules
#### A. Address Lists
Pour simplifier la gestion, l'utilisation de Liste permet de simplifier la gestion du Pare-feu

#### B. Règles de base
Par défaut le Pare-feu bloque par les ports en sortie et ne bloque pas les communications entre lan.
##### 1. WinBox
Pour éviter de se bloquer, il faut faire la règle suivante. En cas de blocage accéder depuis l'adresse MAC.
```
Chain          : Input
Protocol       : TCP
Any. Port      : 80,443,8291
Action         : Accept
IN. Interface  : LAN
```

##### 2. Surf Internet
```
Chain          : Forward
Protocol       : TCP
Any. Port      : 53,80,443
Action         : Accept

Chain          : Forward
Protocol       : UDP
Any. Port      : 53
Action         : Accept
```

##### 3. Ping Routeur
```
Chain          : Forward
Dest. Address  : 192.168.0.1
Protocol       : ICMP
Action         : Accept
```

##### 4. SpeedTest
```
Chain          : Forward
Protocol       : TCP
Any. Port      : 8080
Action         : Accept
```

##### 5. Blocage de port
```
Chain          : Output
Action         : Drop
```

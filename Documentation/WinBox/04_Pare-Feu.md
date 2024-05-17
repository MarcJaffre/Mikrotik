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

#### B. Création d'une règle NAT par Zone
##### 1. LAN
Permet au LAN d'avoir tous les ports en sortie ouverts.
```
Chain          : srcnat
src Address    : 192.168.220.0/24
Out. Interface : WAN
Action         : Masquerade
```

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/14eefcf2-5e84-4191-8c64-235eddf0433f)

##### 2. WAN
Permet au LAN d'avoir tous les ports en sortie ouverts.
```
Chain          : srcnat
src Address    : 192.168.240.0/24
Out. Interface : WAN
Action         : Masquerade
```
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/2723bfe0-3ee3-4dc1-9130-f70cf05123a3)



#### C. Création d'une règle NAT par Zone avec Filtrage de Port
Permet de filtrer les ports sortants autorisés avec du filtrage réseaux. On aurait pu définir une IP au lieu d'un réseau.
##### 1. LAN, DMZ
```
Chain          : srcnat
src Address    : 192.168.220.0/24 | 192.168.240.0/24
Protocol       : TCP
Dst Port       : 53,80,443
Out. Interface : WAN
Action         : Masquerade
Log            : Cocher
Log Prefix     : [NAVIGATION] 
COMMENT        : Web (TCP)
```

```
Chain          : srcnat
src Address    : 192.168.220.0/24 | 192.168.240.0/24
Protocol       : UDP
Dst Port       : 53
Out. Interface : WAN
Action         : Masquerade
Log            : Cocher
Log Prefix     : [NAVIGATION] 
COMMENT        : Web (UDP)
```


```
Chain          : srcnat
src Address    : 192.168.220.0/24 | 192.168.240.0/24
Dist Address   : 192.168.200.1
Protocol       : ICMP
Out. Interface : WAN
Action         : Masquerade
Log            : Cocher
Log Prefix     : [ICMP]
COMMENT        : Ping vers Passerelle
```


![image](https://github.com/Drthrax74/Mikrotik/assets/35907/1464e7aa-cd1a-4de8-9b3f-156bc78ba474)

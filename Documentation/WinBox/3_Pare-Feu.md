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
##### 1. LAN

```
Chain          : srcnat
src Address    : 192.168.220.0/24
Out. Interface : WAN
Protocol       : TCP
Dst Port       : 53
Action         : Masquerade
COMMENT        : DNS
```

```
Chain          : srcnat
src Address    : 192.168.220.0/24
Out. Interface : WAN
Protocol       : UDP
Dst Port       : 53
Action         : Masquerade
COMMENT        : DNS
```

```
Chain          : srcnat
src Address    : 192.168.220.0/24
Out. Interface : WAN
Protocol       : TCP
Dst Port       : 80,443
Action         : Masquerade
COMMENT        : HTTP, HTTPS
```

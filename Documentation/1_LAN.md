------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration de l'interface LAN </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Configuration de l'interface LAN
### A. Lister les interfaces
Depuis le panel Web, aller dans  `Interfaces`.
```
/interface print
```
<p align='center'> <img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1a858d79-5561-4730-9606-3b052cfc2a88' /> </p>

<br />
<br />



### B . Afficher la configuration actuelle
Depuis le panel Web, aller dans  `IP > Addresses`.
```
/ip address/print
```
![image](https://github.com/Drthrax74/Mikrotik/assets/35907/bebc84ea-b977-45ba-b12c-f84682c0b55c)
<br /><br />






### X . Configurer l'interface LAN (Pont)
Le pont `local` aura l'interface `ether2` accrochée sur celui-ci.

#### 1. Création d'un Pont
Depuis le panel Web, aller dans  `Bridge`.
```
/interface bridge add name=local
```
#### 2. Attribuer un port Ethernet au pont
Depuis le panel Web, aller dans  `Bridge > Ports`.
```
/interface bridge port add interface=ether2 bridge=local
```

#### 3. Définir une IP statique à l'interface
Depuis le panel Web, aller dans  `IP > Addresses`.
```
/ip address add address=192.168.200.1/24 interface=local
```

#### 4 . Configurer un serveur DHCP
Pour accder au menu de configuration depuis la WebUI : `Ip -> DHCP Server` 
```
/ip dhcp-server setup
 > DHCP server interface: local
 > DHCP address space: 192.168.200.0/24
 > Gateway for dhcp network: 192.168.200.1
 > Addresses to give out: 192.168.88.2-192.168.88.254 [enter]
 > Dns servers: 192.168.200.1
 > lease time: 1800

 >  window, DHCP
```
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration d'une interface </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Configuration de l'interface LAN
### A. Lister les interfaces
```
/interface print
```
<p align='center'> <img src='https://github.com/Drthrax74/Mikrotik/assets/35907/1a858d79-5561-4730-9606-3b052cfc2a88' /> </p>

<br />
<br />

### B . Afficher la configuration actuelle
```
/ip address/print
```
<p align='center'> <img src='https://github.com/Drthrax74/Mikrotik/assets/35907/bebc84ea-b977-45ba-b12c-f84682c0b55c' /> </p>
<br />
<br />


### X . Configurer l'interface réseau
Le pont `local` aura l'interface `ether2` accrochée sur celui-ci.
#### 1. Création d'un Pont
Depuis le panel Web, aller dans  `Bridge`.
```
/interface bridge add name=local
```
<br />
<br />

#### 2. Attribuer un port Ethernet au pont
```
/interface bridge port add interface=ether2 bridge=local
```
<br />
<br />

#### 3. Définir une IP statique à l'interface
```
/ip address remove numbers=0
/ip address add address=192.168.200.50/24 interface=local
/ip route add gateway=192.168.200.1
/ip dns set servers=192.168.200.1
```

<br />
<br />


#### 5 . Configurer un serveur DHCP
Pour accder au menu de configuration depuis la WebUI : `Ip -> DHCP Server` 
```
/ip dhcp-server setup
 > DHCP server interface: local
 > DHCP address space: 192.168.200.0/24
 > Gateway for dhcp network: 192.168.200.1
 > Addresses to give out: 192.168.200.2-192.168.200.254 [enter]
 > Dns servers: 192.168.200.1
 > lease time: 1800
```
<br />

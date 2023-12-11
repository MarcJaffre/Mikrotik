-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p alig='center'> Configuration de base d'un équipement Mikrotik </p>

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
```
Utiliser le paramètre / pour être sûre que la commande se passe à la racine et pas dans le menu actuellement
```

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Configuration de base
### A. Premier démarrage
Pour accéder au routeur depuis WinBox, il faut faire le processus de configuration du premier démarrage.
```

- Identifiant  : admin (Clavier en Qwerty)
- Mot de passe : <aucun>

- Do you want to see the software license? [Y/n]: N
- Définir un mot de passe
```
<br />

### B. Remise à zéro
Depuis le panel Web, aller dans `System > Reset Configuration`. (No Defaults Configuration, Do Not Backup)
```
/system reset-configuration no-defaults=yes skip-backup=yes
```
<br />

### C . Lister les interfaces (NAME, TYPE, MTU, MAC)
Depuis le panel Web, aller dans  `Interfaces`.
```
/interface print
```
<br />

### X . Afficher la configuration des interfaces.
Depuis le panel Web, aller dans  `IP > Addresses`.
```
/ip address/print
```
<br />

### X . Configurer l'interface LAN (Pont)
Le pont `local` aura l'interface `ether1` accrochée sur celui-ci.

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
<br />


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

### X . Configurer l'interface WAN
Définir une IP Statique à l'interface `ether1`.
#### 1. Désactiver le mode Client DHCP 
```
/ip dhcp-client add disabled=no interface=ether1
```
#### 2. Définiur une IP Statique
```
/ip address add address=192.168.0.245/24 interface=ether1
```
#### 3. Définir une passerelle
```
/ip route add gateway=192.168.0.1
```
#### 4. Définir un serveur DNS
```
/ip dns set servers=192.168.0.1
```
<br />



### X . XXXXXX
```
```

### X . XXXXXX
```
```

### X . XXXXXX
```
```

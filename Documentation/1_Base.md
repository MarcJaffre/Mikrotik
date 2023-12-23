------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configurer des interfaces WAN et LAN
#### A. Création des Bridges
Aller dans le menu `Bridge` et dans l'onglet `Bridge` cliquer sur `+`.
```
Pont 1: WAN
Pont 2: LAN
```

<br />

#### B. Attribuer un port au Bridge
Aller dans le menu `Bridge` et dans l'onglet `Ports` cliquer sur `+` et liée l'interface.
```
Ether1 => WAN
Ether2 => LAN
```


#### C. Configurer l'adresse IP
##### 1. LAN
Aller dans le menu `IP` puis `Adresses` et cliquer sur `+`.
```
 > Address   : 192.168.100.1/24
 > Network   : 192.168.100.0
 > Interface : LAN
```




#### D. Désactiver le DHCP Client
L'interface `ether1` à la fonction DHCP Client activé.


#### E. Vérification
Il suffit de se déconnecter et reconnecter et vérifier dans `IP` puis `Adresses`.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Serveur DHCP
#### A. Création d'un serveur DHCP
Aller `IP` > `DHCP Server` > `DHCP SETUP` >  `LAN` et indiquer comme nom `DHCP_LAN` .

```
Passerelle: 192.168.100.1
Plage DHCP: 192.168.100.2 - 192.168.100.254
```

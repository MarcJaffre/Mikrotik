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

#### B. Attribuer un port au Bridge vmbr0
Aller dans le menu `Bridge` et dans l'onglet `Ports` cliquer sur `+` et liée l'interface.

```
Ether1 => WAN
Ether2 => LAN
```


#### C. Configurer l'adresse IP
Aller dans le menu `IP` puis `Adresses` et cliquer sur `+`.
```
 > Address   : 192.168.0.200/24
 > Network   : 192.168.0.0
 > Interface : WAN
```

```
 > Address   : 192.168.100.0/24
 > Network   : 192.168.100.0
 > Interface : LAN
```

#### D. Vérification
Il suffit de se déconnecter et reconnecter et vérifier dans `IP` puis  `Adresses`.

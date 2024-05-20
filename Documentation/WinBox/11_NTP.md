----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration du NTP sur un équipement Mikrotik </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
Le Network Time Protol sert pour synchroniser les horloges entre différent matériel. Ceci évite qu'un équipement envoie une requête soit dans le passé ou dans le futur par rapport à un autre équipement.

https://www.youtube.com/watch?v=oz_O8UYQSA4

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Configuration du NTP
#### A. Ajuster le fuseau horaire
Menu de sélection `System` > `Clock`.
```
Time Zone Name: Europe/Paris
```

<br />

#### B. Activation du client NTP
Menu de sélection `System` > `NTP Client` > `Enabled` > `NTP Servers`.
```
0.fr.pool.ntp.org
1.fr.pool.ntp.org
2.fr.pool.ntp.org
3.fr.pool.ntp.org
```

<br />

#### C. Activation du serveur NTP
##### 1. Création du serveur NTP
Menu de sélection `System` > `NTP Server` > `Enabled` > `Manycast`.

##### 2. Règle de Pare-Feu (Optionnel)
Pour éviter toute anomalie de fonctionnement, il faut créer une règle NTP par réseau LAN.


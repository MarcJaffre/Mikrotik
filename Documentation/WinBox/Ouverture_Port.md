---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Ouverture de Ports </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### A. Objectif
Le PC A doit accéder au PC B depuis le WAN avec modification du port en entrée.
```
PC A > 3390 > ROUTEUR > 3389 > PC B
```

#### B. Création de la règle
Les interfaces se nomme `WAN` et `LAN` .

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/a2017e10-fb3d-492f-b320-aa9afbdcc811)

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/ccff88ae-b01a-427f-9002-863c371c383d)


#### C. SNMP
La machine `192.168.200.12` est autorisé à envoyé sur le port `161/TCP` à l'hôte `192.168.200.50`

<br />

![image](https://github.com/Drthrax74/Mikrotik/assets/35907/305f47c0-205c-4a18-b3f5-a987ceb6597a)

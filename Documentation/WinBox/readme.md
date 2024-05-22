### Principe sur la maitrise d'un flux
```
On peux manipuler que sur le flux entrant d'un routeur !
```

```
Source > Prerouting > Forward > Postrouting > Destination
```

### Filter
```
- Input       : Entrée du Firewall
- Output      : Sortie du Firewall
- Forward     : Traverse plusieurs interface
```

### Chaine
```
- Postrouting : Après le traitement du paquet
- Prerouting  : Avant le traitement du paquet
```

### QoS
```
Upload   : On manipule sur les flux entrants du routeur. ==> Prerouting
Download : On manipule sur les flux entrants du routeur. ==> Forward 
```


![image](https://github.com/MarcJaffre/Mikrotik/assets/35907/b6dd4123-30cd-4cd9-88fa-8f4a5dd71913)

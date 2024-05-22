### Schema IPTables
![image](https://github.com/MarcJaffre/Mikrotik/assets/35907/b6dd4123-30cd-4cd9-88fa-8f4a5dd71913)

### Principe sur la maitrise d'un flux
```
On peux manipuler que sur le flux entrant d'un routeur !
```

### QoS
```
Upload   : On manipule sur la chaine  Prerouting pour les flux entrants du routeur.
Download : On manipule  sur la chaine Forward    pour les flux sortants du routeur.
```

### Chaine
```
- Forward     : Traverse plusieurs interface
- Postrouting : Après le traitement du paquet
- Prerouting  : Avant le traitement du paquet
- Input       : Entrée du Firewall
- Output      : Sortie du Firewall
```

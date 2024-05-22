### Principe sur la maitrise d'un flux
```
On peux manipuler que sur le flux entrant d'un routeur !
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
Prerouting = Envoie         = On limite le flux lorsqu'il entre dans le routeur
Forward    = Téléchargement = Le flux viens de l'extérieur, on manipule lorsqu'il passe entre le WAN et le LAN.
```



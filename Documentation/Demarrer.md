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
L'identifiant est `admin` et aucun mot de passe est par défaut.

- `Do you want to see the software license? [Y/n]:` N
  
- Définir un mot de passe

### B. Remise à zéro
```
/system reset-configuration no-defaults=yes skip-backup=yes
```

### X . Lister les interfaces (NAME, TYPE, MTU, MAC)
```
/interface print
```

### X . Afficher la configuration des interfaces.
```
/ip dhcp-client/print
```

### X . Configurer une interface 
Définir une IP Statique à l'interface `ether1`.
```
/ip address add address=192.168.0.245/24 interface=ether1
```

### X . XXXXXX
```
```

### X . XXXXXX
```
```





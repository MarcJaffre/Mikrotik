--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Mise en place d'une liaison internet en FailOver sur un routeur Mikrotik </p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation du LAB
Le routeur 1 sera le FAI et le routeur 2 sera le client ayant 2 Liens internet.

#### A. Routeur 1
Le routeur 1 disposera de 3 Interfaces.
```
WAN  : 192.168.0.50
ISP1 : 192.168.100.1
ISP2 : 192.168.200.1
```  

#### B. Routeur 2
Le routeur 1 disposera de 3 Interfaces.
```
WAN1: 192.168.100.2
WAN2: 192.168.200.2
LAN : 192.168.0.80
```

<br />

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Mise en place du FailOver
#### A. Création des routes
###### 1. Cas 1 - FailOver 
Le basculement est très lent. Si le Masquerade est KO, le liens reste à l'état UP malgré que l'internet marche pas. 
```
[ISP1]
- Dst. address: 0.0.0.0/0
- Gateway     : 192.168.100.1
- Check GW    : Ping
- Distance    : 1
- Scope       : 30
- Target Scope: 10

[ISP2]
- Dst. address: 0.0.0.0/0
- Gateway     : 192.168.200.1
- Check GW    : Ping
- Distance    : 5
- Scope       : 30
- Target Scope: 10
```

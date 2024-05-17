------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un lien PPP (Théorique) </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
Un lien PPPxx est un mécanisme d'authentification pour l'accès internet.

<br />


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configuration d'un lien PPP
#### A. PPPoE ([RFC2516](https://www.rfc-editor.org/rfc/rfc2516.html))
##### 1. Configuration
Menu de sélection `PPP` > `+` > `PPPoE Client`.
```
[GENERAL]
- Name            : Indiquer un nom utile (pppoe-fai-<OPERATEUR>)
- Interfaces      : Sélectionner l'interface sur laquel le lien sera connecté physiquement (Port)

[Dial Out]
- User            : Identifiant de connexion
- Password        : Mot de passe du compte

Dial On Demand    : Connexion à l'utilisation. (Si le système d'authentification est lent, la relance d'internet sera lente)
Use Peer DNS      : Obtenir les DNS automatiquement depuis la liaison PPPoE.
Add Default Route : Permet l'ajout d'une route automatiquement.
```

<br />

##### 2. NAT (Masquerade)
Menu de sélection `IP` > `Firewall` > `NAT`. Dans l'exemple suivant aucun filtrage de port en sortie. (RDP, Tunnel SSH, VPN peut être monté par un User)

```
[GENERAL]
- Chain          : srcnat
- Src Address    : Indiquer l'adresse Réseau qui sera autorisé à accéder à internet.
- Out. Interface : Sélectionner l'interface sur laquel le lien sera connecté physiquement (pppoe-fai-<OPERATEUR>).

[Action]
- Action         : Masquerade
```




##### 3. Vérification
Menu de sélection `IP` > `Addresses` pour vérifier si une IP est fournis. (DHCP requis côté FAI)

Menu de sélection `IP` > `Routes` pour vérifier si une route est fournis. (DHCP requis côté FAI)

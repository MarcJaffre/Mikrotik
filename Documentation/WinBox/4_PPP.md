------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un lien PPP (Théorique) </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
Un lien PPPxx est un mécanisme d'authentification pour l'accès internet.

<br />


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configuration d'un lien PPP
#### A. PPPoE
Menu de sélection `PPP` > `+` > `PPPoE Client`.

```
[GENERAL]
- Name       : Indiquer un nom utile (pppoe-fai-<OPERATEUR>)
- Interfaces : Sélectionner l'interface sur laquel le lien sera connecté physiquement (Port)

[Dial Out]
- User       : Identifiant de connexion
- Password   : Mot de passe du compte

Dial On Demand    : Connexion à l'utilisation. (Si le système d'authentification est lent, la relance d'internet sera lente)
Use Peer DNS      : Obtenir les DNS automatiquement depuis la liaison PPPoE.
Add Default Route : Permet l'ajout d'une route automatiquement.
```

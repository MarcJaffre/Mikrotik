-------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Mise en place d'un Serveur VPN sous Mikrotik </p>


-------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Procédure de création du VPN
Les VPN PPTP, L2TP ont toujours la même procédure.
```
- Création d'un Pool (192.168.100.2-192.168.100.20)
- Activation du SERVER via le menu PPP
- Création d'un Profil (IP : 192.168.100.1 + DNS 8.8.8.8)
- Création d'un utilisateur utilisant le profil
- Connexion
```

<br />

-------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Création d'un VPN

#### A. Création du Pool VPN
Menu de sélection `IP` > `Pool` > `+`. Le pool doit exclure 1 IP qui sera celle utilisé par le serveur.

![VPN_Pool](https://github.com/MarcJaffre/Mikrotik/assets/35907/b6add9bd-e624-458f-b3d1-9994a1f5a34a)

<br />

#### B. Création du serveur PPTP
##### 1. Activation du service PPTP
Menu de sélection `PPP` > `Interface` > `PPTP Server` > `Enabled`.

##### 2. Ajout d'un Profile
Menu de sélection `PPP` > `Interface` > `Profiles` > `+`.

![PPP_Profil_Page_1](https://github.com/MarcJaffre/Mikrotik/assets/35907/fb89174e-1201-4c6f-b2b0-968cce295d4e)

<br />

![PPP_Profil_Page_2](https://github.com/MarcJaffre/Mikrotik/assets/35907/a9279bcb-4867-4be0-a0d2-e8b3e19a2e76)

<br />

![PPP_Profil_Page_3](https://github.com/MarcJaffre/Mikrotik/assets/35907/2b4e18ce-849e-4503-ac34-2b13a7920e9d)

<br />

##### 3. Création d'un Utilisateur utilisant le profil
Menu de sélection `PPP` > `Interface` > `Secret` > `+`.

![User](https://github.com/MarcJaffre/Mikrotik/assets/35907/e92ad83b-0a4d-4552-a00d-ab1c1599e5dc)

<br />

#### C. Connexion
Il ne reste plus qu'à se connecter sur le VPN

#### D. Afficher les connexions actifs
![Active_Connections](https://github.com/MarcJaffre/Mikrotik/assets/35907/3ce44083-f6b1-419f-8a47-286b2d8640a6)

<br />

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration du Pare-feu </p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Rappel de l'environnement
L'adresse IP WAN de l'équipement est 192.168.200.50/24 et sa passerelle est 192.168.200.1.

L'adresse IP LAN de l'équipement est 192.168.220.1/24.

Toute requête sur un réseau inconnu va sur la passerelle 192.168.200.1.

<br />


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Internet
Pour avoir accès à internet, il faut définir le WAN en mode Masquerade pour définir que l'IP de sortir est celle du routeur. (IP WAN)

#### A. Création d'une Règle NAT
Menu de sélection `IP` > `Firewall` > `NAT` > `+`. 

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/20867a8f-e62d-4481-b8c1-a939184dff95' />

<br />

<img src='https://github.com/Drthrax74/Mikrotik/assets/35907/d7519170-c70a-40a9-8238-17940894200d' />

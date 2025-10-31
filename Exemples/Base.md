------------------------------------------------------------------------------------
# <p align='center'> Configuration d'un Routeur Mikrotik </p>
------------------------------------------------------------------------------------
## I. Général
### A. Présentation
Le routeur aura 3 pattes : WAN, LAN et DMZ
### B. Plan d'adressage

| Zone | Interface | Adresse IPv4  | Adresse Passerelle |
|------|-----------|---------------|--------------------| 
| WAN  | Eth0      | 192.168.0.6   | 192.168.0.1        |
| LAN  | Eth1      | 192.168.20.1  | ------------------ |
| DMZ  | Eth3      | 192.168.30.1  | ------------------ |

### C. Se connecter
Taper l'identifiant `admin` et taper `entrer` pour le mot de passe.

### D. Définir l'adresse IP en Static
```
/ip address add address=192.168.0.6/24 interface=ether1
/ip dhcp-client disable ether1
```

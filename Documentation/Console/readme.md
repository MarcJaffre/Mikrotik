---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik en Ligne de commande </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Configuration de base
#### A. Nommer le routeur 
```bash
/system identity
set name=Routeur
```

#### B. Définir le Fuseau Horaire sur Paris
```bash
/system clock
set time-zone-name=Europe/Paris
```

#### C. NTP
##### 1. Client
```bash
/system ntp client
set enabled=yes
```
##### 2. Server
```bash
/system ntp server
set enabled=yes manycast=yes
```

##### 3. Client/Servers
```bash
/system ntp client servers
add address=0.fr.pool.ntp.org
add address=1.fr.pool.ntp.org
add address=2.fr.pool.ntp.org
add address=3.fr.pool.ntp.org
```

<br />



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Sécurisation de l'équipement
#### A. Création d'un utilisation 
```bash
/user
add name="marc"    group="full" password="admin" comment="Marc Jaffre" address="192.168.150.0/24, 192.168.180.0/24, 192.168.20.0/24"
```

#### B. Suppression Utilisateur admin
```bash
/user
remove admin
```

#### C. Edition des permissions
```
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,!api,!romon,!rest-api"
```

#### D. Configuration des services
```bash
/ip service
set telnet  disabled=yes
set ftp     disabled=yes
set ssh     disabled=yes
set api     disabled=yes
set api-ssl disabled=yes
set winbox  address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24
set www     address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24
set www-ssl disabled=yes
```

#### E. Mac Servers
##### 1. Général
```bash
/tool mac-server
set allowed-interface-list=none
```
##### 2. Ping
```bash
/tool mac-server ping
set enabled=no
```

#### F. XXXX
```
```


<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Avancés
#### A. Interfaces
##### 1. Modifier le nom des Interfaces réseaux
```bash
/interface ethernet
set [ find default-name=ether1 ] name=ether1-wan
set [ find default-name=ether2 ] name=ether2-lan
set [ find default-name=ether3 ] name=ether3-dmz
```
##### 2. Configuration IP des interfaces
```bash
/ip address
add address=192.168.200.50/24 interface=ether1-wan network=192.168.200.0
add address=192.168.220.1/24  interface=ether2-lan network=192.168.220.0
add address=192.168.240.1/24  interface=ether3-dmz network=192.168.240.0
```
#### B. Création de la route par défaut
```bash
/ip route
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=192.168.200.1 pref-src="" routing-table=main scope=30 suppress-hw-offload=yes target-scope=10
```
#### C. Configuration du DNS pour le routeur
```bash
/ip dns
set allow-remote-requests=yes servers=192.168.200.1,8.8.8.8
```

#### D. DHCP
##### 1. Création des Pools
```bash
/ip pool
add name=LAN ranges=192.168.220.2-192.168.220.254
add name=DMZ ranges=192.168.240.2-192.168.240.10
```

##### 2. Network
```bash
/ip dhcp-server
add add-arp=yes address-pool=LAN interface=ether2-lan name=DHCP_LAN
add add-arp=yes address-pool=DMZ interface=ether3-dmz name=DHCP_DMZ
```

#### E. Pare-Feu
##### 1. Autoriser le surf
```bash
/ip firewall nat
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=udp
add action=masquerade chain=srcnat comment=HTTP                      dst-port=80                                  out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=HTTPS                     dst-port=443                                 out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=tcp
```
##### 2. Autoriser le Speedtest
```bash
/ip firewall nat
add action=masquerade chain=srcnat comment=Speedtest                 dst-port=8080                                out-interface=ether1-wan protocol=tcp
```
##### 3. Autoriser le ping vers la Passerelle
```bash
/ip firewall nat
add action=masquerade chain=srcnat comment="Ping vers Passerelle"    dst-address=192.168.200.1 log-prefix="[GW] " out-interface=ether1-wan protocol=icmp
```


<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### V. Mise en place de la Tree Queue (QoS)
#### A. Mangle
Pour permettre de gérer les flux, il faut dans un premier temps marquer les connexions puis les paquets. Puis créer des règles de limitation.
##### 1. Marquer les flux sortants (Upload)
```bash
/ip firewall mangle
add action=mark-connection chain=prerouting comment=UPLOAD   in-interface=ether2-lan new-connection-mark=CONNEXION-SORTANTE  passthrough=yes
add action=mark-packet     chain=prerouting connection-mark=CONNEXION-SORTANTE new-packet-mark=UP-Speedtest                  passthrough=no port=8080   protocol=tcp
add action=mark-packet     chain=prerouting connection-mark=CONNEXION-SORTANTE new-packet-mark=UP-Web                        passthrough=no port=80,443 protocol=tcp
add action=mark-packet     chain=prerouting connection-mark=CONNEXION-SORTANTE new-packet-mark=UP-Autre                      passthrough=no
```
##### 2. Marquer les flux entrants (Download)
```bash
/ip firewall mangle
add action=mark-connection chain=forward    comment=DOWNLOAD in-interface=ether1-wan new-connection-mark=CONNEXION-ENTRANTE  passthrough=yes
add action=mark-packet     chain=forward    connection-mark=CONNEXION-ENTRANTE new-packet-mark=DL-Speedtest                  passthrough=no port=8080   protocol=tcp
add action=mark-packet     chain=forward    connection-mark=CONNEXION-ENTRANTE new-packet-mark=DL-Web                        passthrough=no port=80,443 protocol=tcp
add action=mark-packet     chain=forward    connection-mark=CONNEXION-ENTRANTE new-packet-mark=DL-AUTRE                      passthrough=no
```


#### B. Création de la Queue Tree
##### 1. Squelette
```bash
/queue tree
add              name=Network                                 parent=global         priority=1
add              name=Trafic-Entrant                          parent=Network        priority=2
add              name=Trafic-Sortant                          parent=Network        priority=2
```
##### 2. Upload
```bash
add max-limit=1M name=AUTRE-UP       packet-mark=UP-Autre     parent=Trafic-Sortant priority=3
add max-limit=5M name=WEB-UP         packet-mark=UP-Web       parent=Trafic-Sortant priority=3
add max-limit=5M name=SPEEDTEST-UP   packet-mark=UP-Speedtest parent=Trafic-Sortant priority=3
```

##### 3. Download
```bash
add max-limit=1M name=AUTRE-DL       packet-mark=DL-AUTRE     parent=Trafic-Entrant priority=3
add max-limit=5M name=WEB-DL         packet-mark=DL-Web       parent=Trafic-Entrant priority=3
add max-limit=5M name=SPEEDTEST-DL   packet-mark=DL-Speedtest parent=Trafic-Entrant priority=3
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

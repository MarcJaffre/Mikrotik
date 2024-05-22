---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik en Ligne de commande </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Sécurisation de l'équipement

#### X. Configuration des services
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

#### X. Mac Servers
```bash
/tool mac-server
set allowed-interface-list=none
```

#### X. Mac Servers ping
```bash
/tool mac-server ping
set enabled=no
```

#### X. Edition des permissions
```
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,!api,!romon,!rest-api"
```

#### X. Création d'un utilisation 
```bash
/user
add name="marc"    group="full" password="admin" comment="Marc Jaffre" address="192.168.150.0/24, 192.168.180.0/24, 192.168.20.0/24"
```

#### X. Suppression Utilisateur admin
```bash
/user
remove admin
```

<br />






---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Avancés
#### A. Interfaces
##### 1. Renommer les Interfaces
```bash
/interface ethernet
set [ find default-name=ether1 ] name=ether1-wan
set [ find default-name=ether2 ] name=ether2-lan
set [ find default-name=ether3 ] name=ether3-dmz
```
##### 2. Configuration interfaces
```bash
/ip address
add address=192.168.200.50/24 interface=ether1-wan network=192.168.200.0
add address=192.168.220.1/24  interface=ether2-lan network=192.168.220.0
add address=192.168.240.1/24  interface=ether3-dmz network=192.168.240.0
```
#### B. Configuration de la route
```bash
/ip route
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=192.168.200.1 pref-src="" routing-table=main scope=30 suppress-hw-offload=yes target-scope=10
```
#### C. Configuration du DNS
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
```bash
/ip firewall nat
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=udp
add action=masquerade chain=srcnat comment=HTTP                      dst-port=80                                  out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=HTTPS                     dst-port=443                                 out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=Speedtest                 dst-port=8080                                out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment="Ping vers Passerelle"    dst-address=192.168.200.1 log-prefix="[GW] " out-interface=ether1-wan protocol=icmp
```

#### X. Services
```bash
/ip service
set telnet  disabled=yes
set ftp     disabled=yes
set ssh     disabled=yes
set api     disabled=yes
set api-ssl disabled=yes
set www     address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24
set www-ssl address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24 certificate=Certificat-Routeur disabled=no tls-version=only-1.2
set winbox  address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24
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

#### X. 
```bash
```

#### X. 
```bash
```

#### X. 
```bash
```

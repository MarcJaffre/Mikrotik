---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un routeur Mikrotik en Ligne de commande </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Base
#### A. Interfaces
##### 1. Renommer les Interfaces
```
/interface ethernet
set [ find default-name=ether1 ] name=ether1-wan
set [ find default-name=ether2 ] name=ether2-lan
set [ find default-name=ether3 ] name=ether3-dmz
```
##### 2. Configuration interfaces
```
/ip address
add address=192.168.200.50/24 interface=ether1-wan network=192.168.200.0
add address=192.168.220.1/24  interface=ether2-lan network=192.168.220.0
add address=192.168.240.1/24  interface=ether3-dmz network=192.168.240.0
```
#### B. Configuration de la route
```
/ip route
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=192.168.200.1 pref-src="" routing-table=main scope=30 suppress-hw-offload=yes target-scope=10
```
#### C. Configuration du DNS
```
/ip dns
set allow-remote-requests=yes servers=192.168.200.1,8.8.8.8
```

#### D. DHCP
##### 1. Création des Pools
```
/ip pool
add name=LAN ranges=192.168.220.2-192.168.220.254
add name=DMZ ranges=192.168.240.2-192.168.240.10
```

##### 2. Network
```
/ip dhcp-server
add add-arp=yes address-pool=LAN interface=ether2-lan name=DHCP_LAN
add add-arp=yes address-pool=DMZ interface=ether3-dmz name=DHCP_DMZ
```

#### E. Pare-Feu
```
/ip firewall nat
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=udp
add action=masquerade chain=srcnat comment=HTTP                      dst-port=80                                  out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=HTTPS                     dst-port=443                                 out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=Speedtest                 dst-port=8080                                out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment="Ping vers Passerelle"    dst-address=192.168.200.1 log-prefix="[GW] " out-interface=ether1-wan protocol=icmp
```


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Avancés


#### X. Services
```
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
```
```

#### X. 
```
```

#### X. 
```
```

#### X. 
```
```

#### X. 
```
```

<br />



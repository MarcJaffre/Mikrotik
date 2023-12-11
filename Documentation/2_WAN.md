------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration de l'interface WAN </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##




<br />


### X . Configurer l'interface WAN
Définir une IP Statique à l'interface `ether1`.
#### 1. Désactiver le mode Client DHCP 
```
/ip dhcp-client add disabled=no interface=ether1
```
#### 2. Définiur une IP Statique
```
/ip address add address=192.168.0.245/24 interface=ether1
```
#### 3. Définir une passerelle
```
/ip route add gateway=192.168.0.1
```
#### 4. Définir un serveur DNS
```
/ip dns set servers=192.168.0.1
```
<br />



### X . XXXXXX
```
```

### X . XXXXXX
```
```

### X . XXXXXX
```
```

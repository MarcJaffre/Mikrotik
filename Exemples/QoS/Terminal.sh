# =================================================================================================================================================================================
/interface ethernet
set [ find default-name=ether1 ] name=ether1-wan
set [ find default-name=ether2 ] name=ether2-lan
set [ find default-name=ether3 ] name=ether3-dmz
# =================================================================================================================================================================================
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
# =================================================================================================================================================================================
/ip pool
add name=LAN ranges=192.168.220.2-192.168.220.254
add name=DMZ ranges=192.168.220.10-192.168.240.2
# =================================================================================================================================================================================
/ip dhcp-server
add add-arp=yes address-pool=LAN interface=ether2-lan name=DHCP_LAN
add add-arp=yes address-pool=DMZ interface=ether3-dmz name=DHCP_DMZ
# =================================================================================================================================================================================
/queue tree
add              name=Network                                 parent=global         priority=1
add              name=Trafic-Entrant                          parent=Network        priority=2
add              name=Trafic-Sortant                          parent=Network        priority=2
add max-limit=5M name=SPEEDTEST-DL   packet-mark=DL-Speedtest parent=Trafic-Entrant priority=3
add max-limit=5M name=SPEEDTEST-UP   packet-mark=UP-Speedtest parent=Trafic-Sortant priority=3
add max-limit=5M name=WEB-DL         packet-mark=DL-Web       parent=Trafic-Entrant priority=3
add max-limit=5M name=WEB-UP         packet-mark=UP-Web       parent=Trafic-Sortant priority=3
add max-limit=1M name=AUTRE-DL       packet-mark=DL-AUTRE     parent=Trafic-Entrant priority=3
add max-limit=1M name=AUTRE-UP       packet-mark=UP-Autre     parent=Trafic-Sortant priority=3
add max-limit=1M add name=SNMP-DL    packet-mark=DL-SNMP      parent=Trafic-Entrant priority=3
add max-limit=1M add name=SNMP-UP    packet-mark=UP-SNMP      parent=Trafic-Sortant priority=3
# =================================================================================================================================================================================
/snmp community
set [ find default=yes ] write-access=yes
# =================================================================================================================================================================================
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas sword,web,sniff,sensitive,!api,!romon,!rest-api"
# =================================================================================================================================================================================
/ip firewall connection tracking
set udp-timeout=10s
# =================================================================================================================================================================================
/ip address
add address=192.168.200.50/24 interface=ether1-wan network=192.168.200.0
add address=192.168.220.1/24  interface=ether2-lan network=192.168.220.0
add address=192.168.240.1/24  interface=ether3-dmz network=192.168.240.0
# =================================================================================================================================================================================
/ip dhcp-client
add interface=ether1-wan
# =================================================================================================================================================================================
/ip dhcp-server network
add address=192.168.220.0/24 dns-server=192.168.220.1,8.8.8.8 domain=LAN.LOCAL gateway=192.168.220.1 netmask=24
add address=192.168.240.0/24 dns-server=192.168.240.1,8.8.8.8 domain=DMZ.LOCAL gateway=192.168.240.1 netmask=24
# =================================================================================================================================================================================
/ip dns
set allow-remote-requests=yes servers=192.168.200.1,8.8.8.8
# =================================================================================================================================================================================
/ip firewall mangle
add action=mark-connection chain=prerouting comment=UPLOAD   in-interface=ether2-lan new-connection-mark=CONNEXION-SORTANTE  passthrough=yes
add action=mark-packet     chain=prerouting connection-mark=CONNEXION-SORTANTE dst-port="" new-packet-mark=UP-Speedtest      passthrough=no port=8080   protocol=tcp
add action=mark-packet     chain=prerouting connection-mark=CONNEXION-SORTANTE dst-port="" new-packet-mark=UP-Web            passthrough=no port=80,443 protocol=tcp
add action=mark-packet     chain=prerouting connection-mark=CONNEXION-SORTANTE dst-port="" new-packet-mark=UP-SNMP           passthrough=no port=161    protocol=udp
add action=mark-packet     chain=prerouting connection-mark=CONNEXION-SORTANTE             new-packet-mark=UP-Autre          passthrough=no

add action=mark-connection chain=forward    comment=DOWNLOAD in-interface=ether1-wan new-connection-mark=CONNEXION-ENTRANTE  passthrough=yes
add action=mark-packet     chain=forward    connection-mark=CONNEXION-ENTRANTE             new-packet-mark=DL-Speedtest      passthrough=no port=8080   protocol=tcp
add action=mark-packet     chain=forward    connection-mark=CONNEXION-ENTRANTE             new-packet-mark=DL-Web            passthrough=no port=80,443 protocol=tcp
add action=mark-packet     chain=forward    connection-mark=CONNEXION-ENTRANTE             new-packet-mark=DL-SNMP           passthrough=no port=161    protocol=udp
add action=mark-packet     chain=forward    connection-mark=CONNEXION-ENTRANTE             new-packet-mark=DL-AUTRE          passthrough=no
# =================================================================================================================================================================================
/ip firewall nat
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=udp
add action=masquerade chain=srcnat comment=HTTP                      dst-port=80                                  out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=HTTPS                     dst-port=443                                 out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=DNS                       dst-port=53                                  out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment=Speedtest                 dst-port=8080                                out-interface=ether1-wan protocol=tcp
add action=masquerade chain=srcnat comment="Ping vers Passerelle"    dst-address=192.168.200.1 log-prefix="[GW] " out-interface=ether1-wan protocol=icmp
add action=masquerade chain=srcnat comment=SNMP                      dst-port=161 log=yes log-prefix="[SNMP] " protocol=tcp
add action=masquerade chain=srcnat comment=NAT                       disabled=yes out-interface=ether1-wan
# =================================================================================================================================================================================
/ip firewall service-port
set ftp disabled=yes
set tftp disabled=yes
set sip disabled=yes
set rtsp disabled=no
# =================================================================================================================================================================================
/ip route
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=192.168.200.1 pref-src="" routing-table=main scope=30 suppress-hw-offload=yes target-scope=10
# =================================================================================================================================================================================
/ip service
set telnet  disabled=yes
set ftp     disabled=yes
set ssh     disabled=yes
set api     disabled=yes
set api-ssl disabled=yes
set www     address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24
set www-ssl address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24 certificate=Certificat-Routeur disabled=no tls-version=only-1.2
set winbox  address=192.168.150.0/24,192.168.180.0/24,192.168.200.0/24
# =================================================================================================================================================================================
/snmp
set enabled=yes trap-version=2
# =================================================================================================================================================================================
/system clock
set time-zone-name=Europe/Paris
# =================================================================================================================================================================================
/system identity
set name=Routeur
# =================================================================================================================================================================================
/system note
set show-at-login=no
# =================================================================================================================================================================================
/system ntp client
set enabled=yes
# =================================================================================================================================================================================
/system ntp server
set enabled=yes manycast=yes
# =================================================================================================================================================================================
/system ntp client servers
add address=0.fr.pool.ntp.org
add address=1.fr.pool.ntp.org
add address=2.fr.pool.ntp.org
add address=3.fr.pool.ntp.org
# =================================================================================================================================================================================
/tool mac-server
set allowed-interface-list=none

# =================================================================================================================================================================================
/tool mac-server ping
set enabled=no


# =================================================================================================================================================================================
/user settings
set minimum-password-length=4

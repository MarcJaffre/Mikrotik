------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration d'un lien PPP (Théorique) </p>
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
Le routeur PPPoe-server dispose d'une interface WAN et une interface LAN.

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Création d'un PPPoe Server
#### A. Création d'un Pont
Menu `Bridge` puis `+` et indiquer comme nom `PPPoe`.

![image](https://github.com/user-attachments/assets/31dad8af-b358-4d5c-b45a-479801747716)

![image](https://github.com/user-attachments/assets/3f5c7369-84cc-4501-b623-db4014c66d43)

<br />

#### B. Attacher une interface au pont
Menu `Bridge` puis dans l'onglet `Ports` et cliquer sur `+`. Sélectionner l'interface qu'on souhaite rattacher au Pont PPPoe.

![image](https://github.com/user-attachments/assets/c8233f9a-668c-46b2-b520-0b51bc4675fd)

![image](https://github.com/user-attachments/assets/572b2511-efdb-4e86-a821-227ee40ca0d7)

<br />

#### C. Création d'un Pool DHCP pour le PPPoe
Menu `IP` puis `Pool` et cliquer sur `+`.

![image](https://github.com/user-attachments/assets/fbd80e5a-478d-4de0-b27a-34165d25bf5f)

<br />

#### C. Création du masquerade

![image](https://github.com/user-attachments/assets/0ba71af1-b28f-425c-9336-828afb158353)

![image](https://github.com/user-attachments/assets/067ba9f4-4e15-41ed-bba8-f12b0fdde608)

![image](https://github.com/user-attachments/assets/706b3891-921b-4e63-ada7-45bcee2d0880)

<br />

#### D. Création du PPPoe Serveur
Menu `PPP` puis dans l'onglet `PPPoe Server` et `+`. (/!\ Ne pas cliquer sur le `+` dans l'onglet `Interface`)



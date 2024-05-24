---------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'>  Déploiement d'un routeur Mikrotik sous Virtualbox </p>

---------------------------------------------------------------------------------------------------------------------------------------------
## I. Création de la Machine Virtuelle
### A. Télécharge
Il faut se rendre sur le site de Mikrotik, puis aller dans Download.

L'architecture est `X86` et le fichier à télécharge est `CD Image` en version `Stable` .

### B. Création de la Machine Virtuelle
#### 1. Nouvelle Machine Virtuelle
![Nouvelle](https://github.com/MarcJaffre/Mikrotik/assets/35907/d5f29f74-f4f6-4a8e-be13-e155adb1551b)

#### 2. Operating System
Le type est sur `Other` et la version est sur `Other/Unknown (64 Bit)`.

![Operating_System](https://github.com/MarcJaffre/Mikrotik/assets/35907/9e334a36-74b5-444c-a81b-5d5281677496)

#### 3. Mémoire-Vive et Processeur
La mémoire Vive doit être entre 256 Mo et 512 Mo avec 2 CPUs.
![image](https://github.com/MarcJaffre/Mikrotik/assets/35907/55561b00-bebd-42d6-92af-42c931767b37)

#### 4. Stockage
L'image ISO moins de `60 Mo`, il est nécessaire de faire un stockage de `128Mo`.
![Stockage](https://github.com/MarcJaffre/Mikrotik/assets/35907/5768049e-b96d-4dae-a59b-cc3fc358f863)

### C. Configuration de la Machine Virtuelle
#### 1. Système
Décocher le Lecteur Disquette au démarrage et cocher la fonction `VT-x/AMD-V`  pour une meilleur performance.

![Boot](https://github.com/MarcJaffre/Mikrotik/assets/35907/3364e0c4-0914-4e04-89cd-fcf025157d1d)

![Imbrication](https://github.com/MarcJaffre/Mikrotik/assets/35907/de616445-dcce-400f-8c83-3fc5afa3757d)

#### 2. Son
La fonction Son nest pas utile, il est recommande de le désactiver.

![Son](https://github.com/MarcJaffre/Mikrotik/assets/35907/7b88cb4d-20be-4aca-a8b8-b47fa9ee487e)

#### 3. Réseau
Au minimum, il est nécessaire d'avoir 2 interfaces réseaux actif. (WAN et LAN)

L'adapateur 1 aura pour rôle d'être le WAN de mon routeur et il aura une IP sur le réseau de mon routeur.

![WAN](https://github.com/MarcJaffre/Mikrotik/assets/35907/d0e3bb18-acdf-4e15-8ead-6c5de0b7598d)

L'adapateur 2 aura pour rôle d'être le LAN.

![LAN](https://github.com/MarcJaffre/Mikrotik/assets/35907/efcc7b16-b7db-4cb3-890e-ea5e5a84133f)

L'adapateur 3 aura pour rôle d'être la DMZ.

![DMZ](https://github.com/MarcJaffre/Mikrotik/assets/35907/a2d8b3ae-0475-4f55-9188-a55e023f8e4a)


#### 4. USB
La fonction USB nest pas utile, il est recommande de le désactiver.

![USB](https://github.com/MarcJaffre/Mikrotik/assets/35907/59590ddb-5600-4bea-9a55-9ad07f81f5ba)

#### 5. Dossiers Partagés
A voir si c'est utile


<br />

---------------------------------------------------------------------------------------------------------------------------------------------
## II. Installation du routeur Mikrotik
### A. Installation du système
Il suffit de presser la touche `i` puis de répondre à la question par `y`, ensuite il suffit d'éjecter le CDROM et de redémarrer la Machine Virtuelle.

Ensuite l'équipement est prêt à être configurer.

![Press_I](https://github.com/MarcJaffre/Mikrotik/assets/35907/a22927cf-74cd-41fd-8509-2e73908213b0)

![Press_y](https://github.com/MarcJaffre/Mikrotik/assets/35907/db15058d-2c29-49fa-80f6-4cb2241c85d2)

![Press_Reboot](https://github.com/MarcJaffre/Mikrotik/assets/35907/bc350386-83e3-4c70-8a38-26c030c630e6)

![Login](https://github.com/MarcJaffre/Mikrotik/assets/35907/7837e6cd-53c6-489f-8856-ea023bcbb536)

<br />

### B. Connexion
Pour se connecter, il suffit d'avoir télécharger Winbox et faire de faire de la découverte de voisinage.

Utiliser l'adresse MAC pour se connecter

<br />

### C. Recommandation
Je recomandes de réaliser un instantannée ce qui permettra de reset sans problème l'équipement.

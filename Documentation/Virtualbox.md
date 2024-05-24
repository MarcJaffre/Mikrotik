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
La fonction son est inutile sur un routeur, désactiver le son.
![Son](https://github.com/MarcJaffre/Mikrotik/assets/35907/7b88cb4d-20be-4aca-a8b8-b47fa9ee487e)

#### 3. Réseau
Au minimum, il est nécessaire d'avoir 2 interfaces réseaux actif. (WAN et LAN)

L'adapateur 1 aura pour rôle d'être le WAN de mon routeur et il aura une IP sur le réseau de mon routeur.

![WAN](https://github.com/MarcJaffre/Mikrotik/assets/35907/d0e3bb18-acdf-4e15-8ead-6c5de0b7598d)

L'adapateur 2 aura pour rôle d'être le LAN.

![LAN](https://github.com/MarcJaffre/Mikrotik/assets/35907/c8fac2f1-8ad7-4fe2-8327-38c66c0e53aa)

L'adapateur 3 aura pour rôle d'être la DMZ.

![DMZ](https://github.com/MarcJaffre/Mikrotik/assets/35907/a242ddaa-2bee-456f-8bf0-25d2ad547358)




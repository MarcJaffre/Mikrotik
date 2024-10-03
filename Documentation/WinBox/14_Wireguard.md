# Configuration d'un VPN WireGuard sur Mikrotik

## 1. Configuration du serveur Mikrotik
### 1.1 Créer l'interface WireGuard
1. Ouvrez Winbox et connectez-vous à votre routeur Mikrotik
2. Allez dans le menu WireGuard
3. Cliquez sur le bouton "+"
4. Remplissez les champs :
   - Name : `wg0` (ou un autre nom de votre choix)
   - Listen Port : `13231` (ou un autre port de votre choix)
5. Cliquez sur OK. Les clés privée et publique seront générées automatiquement

### 1.2 Assigner une adresse IP à l'interface
1. Allez dans IP > Addresses
2. Cliquez sur le bouton "+"
3. Remplissez les champs :
   - Address : `192.168.77.1/24` (ou une autre plage d'adresses de votre choix)
   - Interface : Sélectionnez l'interface WireGuard créée précédemment
4. Cliquez sur OK

### 1.3 Configurer le pare-feu
1. Allez dans IP > Firewall > Filter Rules
2. Cliquez sur le bouton "+"
3. Remplissez les champs :
   - Chain : `input`
   - Protocol : `udp`
   - Dst. Port : `13231` (le port choisi précédemment)
   - Action : `accept`
4. Cliquez sur OK
5. Assurez-vous que cette règle est placée avant les règles DROP

### 1.4 Créer un peer (client)
1. Allez dans WireGuard > Peers
2. Cliquez sur le bouton "+"
3. Remplissez les champs :
   - Name : Nom du client (ex: `client1`)
   - Interface : Sélectionnez l'interface WireGuard créée précédemment
   - Allowed Address : Une IP dans le sous-réseau de l'interface (ex: `192.168.77.2/32`)
   - Public Key : Laissez vide pour l'instant
4. Cliquez sur OK



## 2. Configuration du client Windows

### 2.1 Installation de WireGuard

1. Téléchargez et installez l'application WireGuard depuis le [site officiel](https://www.wireguard.com/install/)

### 2.2 Configuration du client

1. Ouvrez l'application WireGuard
2. Cliquez sur "Add Tunnel" puis "Add Empty Tunnel"
3. Donnez un nom au tunnel (ex: `Mikrotik-VPN`)
4. Copiez la clé publique générée

### 2.3 Finalisation de la configuration du serveur

1. Retournez dans Winbox
2. Allez dans WireGuard > Peers
3. Éditez le peer créé précédemment
4. Collez la clé publique du client dans le champ "Public Key"
5. Cliquez sur OK

### 2.4 Configuration du fichier client

1. Dans l'application WireGuard sur Windows, éditez le fichier de configuration du tunnel
2. Utilisez le modèle suivant en remplaçant les valeurs entre crochets :

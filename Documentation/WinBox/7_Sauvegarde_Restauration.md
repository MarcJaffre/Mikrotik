------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Sauvegarde, restauration et mise à zéro d'un routeur Mikrotik </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Sauvegarde
#### A. Création de la sauvegarde
Menu de sélection `Files` > `Backup`. La méthode suivante ne permet pas de voir le contenu du fichier en clair.

<br />

#### B. Création de la sauvegarde en clair
Menu de sélection `New Terminal` > `export file=Backup_001`. La sauvegarde en clair permet une fois télécharger, de pouvoir visuellement voir les commandes en format texte.

Ceci permet de pouvoir vérifier les paramètres à post déploiement .

<br />

#### C. Télécharger la sauvegarde
Pour télécharger une sauvegarde, sélectionner le fichier puis sur le bouton copier et sur le poste de travail, il faut faire coller.

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Restauration
Menu de sélection `Files` > `Restore`. Pour envoyer une sauvegarde, sélectionner le fichier sur le poste de travail puis copier le fichier et cliquer sur le bouton coller et le fichier est envoyé.

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Remise à zéro
Menu de sélection `System` > `Reset Configuration`.

```
Keep Users               : Conserver les utilisateurs sur le routeur
Caps Mode                : Configuration du routeur via le service Capsman
No Default Configuration : Ne pas avoir la configuration par défaut
Do Not Backup            : Ne pas faire de sauvegarde avant la Remise à zéro
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Bonnes pratiques
Il est nécessaire de jamais laisser de sauvegarde sur le routeur.

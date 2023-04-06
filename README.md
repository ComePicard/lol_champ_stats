# lol_champ_stats

Projet Flutter d'application listant les champions de League of Legends avec une page de détail
sur les champions et leurs sorts.

## Maquette

[Lien de la maquette](https://www.figma.com/file/jXRkSIXIfu0jiSTJXbofDz/Untitled?node-id=0%3A1&t=gteZXJ3nZNnrcgai-0)

## Environnement Dev

Pour passer outre les problèmes de CORS :

1. Aller dans le dossier `flutter\bin\cache` et supprimer le fichier `flutter_tools.stamp`
2. Aller dans le dossier `flutter\package\flutter_tools\lib\src\web` et ouvrir le
   fichier `chrome.dart`
3. Insérer `'--disable-web-security'` en dessous de la ligne `'--disable-extensions'` (ne pas
   oublier la virgule entre les deux lignes)

## Sources d'erreur potentiels

Ce projet a été développé sous Windows qui ne prend pas en compte la casse dans les noms de fichier
(il ne sait pas faire la différence entre `toto.txt` et `Toto.txt` par exemple). De fait, si le
projet est executé sous Linux ou Mac, si des problèmes du type `No file or variants found for
[fichier]` se manifestent, il est fort probable que la casse en soit responsable.

Vous êtes donc prié de soit me faire remonter le problème ou bien de le corriger de vous-même en
**local**.

**Attention :** Si vous souhaitez monter les modifications sur ce repo. Il est **impératif** de
suivre la démarche suivante, sous peine de rendre le projet inaccessible à tous les utilisateurs de
Windows.

Démarche à suivre :
Pour la démarche je vais prendre un exemple avec un fichier nommé `Test.txt` que je veux renommer
`test.txt`.

1. Renommer le fichier `Test.txt` en `temp.txt`
2. Faire un faire premier commit avec la commande  `git commit -am "rename text.txt 1/2"`
3. Renommer le fichier `temp.txt` dans son nom final `test.txt`
4. Commit et push le changement `git commit -am "rename text.txt 2/2"`

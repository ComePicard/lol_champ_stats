# lol_champ_stats

Projet Flutter d'application listant les champions de League of Legends avec une page de détail.

## Maquette

[Lien de la maquette](https://www.figma.com/file/jXRkSIXIfu0jiSTJXbofDz/Untitled?node-id=0%3A1&t=gteZXJ3nZNnrcgai-0)

## Environnement Dev

Pour passer outre les problèmes de CORS :
1. Aller dans le dossier `flutter\bin\cache` et supprimer le fichier `flutter_tools.stamp`
2. Aller dans le dossier `flutter\package\flutter_tools\lib\src\web` et ouvrir le fichier `chrome.dart`
3. Insérer `'--disable-web-security'` en dessous de la ligne `'--disable-extensions'` (ne pas oublier la virgule entre les deux lignes)
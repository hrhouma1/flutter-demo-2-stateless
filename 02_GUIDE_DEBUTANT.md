# Guide pour Debutants - Structure Flutter

## [02] Guide Debutant - A lire apres 01_README.md

## Objectif

Comprendre comment un projet Flutter est organise avec plusieurs fichiers.

---

## Vue d'Ensemble

```
+-------------------------------------------------------------+
|                      PROJET FLUTTER                         |
|                                                             |
|  lib/                                                       |
|  ├── main.dart .................... Point de depart        |
|  |                                                          |
|  ├── pages/                                                 |
|  |   └── home_page.dart .......... Page d'accueil          |
|  |                                                          |
|  └── widgets/ .................... Composants reutilisables |
|      ├── titre_section.dart                                 |
|      ├── container_colore.dart                              |
|      ├── section_row.dart                                   |
|      ├── section_cartes.dart                                |
|      ├── carte_info.dart                                    |
|      ├── section_icones.dart                                |
|      └── bouton_decoratif.dart                              |
|                                                             |
+-------------------------------------------------------------+
```

---

## Le Parcours de l'Application

### Etape 1 : Demarrage (`main.dart`)

```dart
void main() {              // <- C'est ici que tout commence !
  runApp(MonApplication());
}
```

**Analogie :** C'est comme appuyer sur le bouton de demarrage d'un ordinateur.

### Etape 2 : Configuration (`MonApplication`)

```dart
class MonApplication extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(        // <- Configuration de l'app
      home: PageAccueil(),     // <- Quelle page afficher ?
    );
  }
}
```

**Analogie :** On configure les preferences (theme, couleurs, page de demarrage).

### Etape 3 : Page d'Accueil (`PageAccueil` dans `pages/home_page.dart`)

```dart
class PageAccueil extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(          // <- Structure de la page
      appBar: AppBar(...),    // <- Barre du haut
      body: Column(           // <- Contenu principal
        children: [
          TitreSection(...),        // <- Widget 1
          ContainerColore(...),     // <- Widget 2
          SectionRow(...),          // <- Widget 3
          // etc.
        ],
      ),
    );
  }
}
```

**Analogie :** C'est la page web qu'on voit, avec tous ses elements.

---

## Comment les Fichiers se Parlent

### Schema des Imports

```
+-------------+
|  main.dart  |
|             |
|  import     |
|  'pages/    |
|  home_page  |
|  .dart'     |
+------+------+
       |
       | utilise
       v
+------------------+
| home_page.dart   |
|                  |
| import '../widgets
| /titre_section.  |
| dart'            |
|                  |
| import '../widgets
| /container_colore|
| .dart'           |
|                  |
| import '../widgets
| /section_row.dart'
+--------+---------+
         |
         | utilise
         v
+--------------------+
| titre_section.dart |
| container_colore.dart
| section_row.dart   |
| etc.               |
+--------------------+
```

---

## Anatomie d'un Fichier Widget

Prenons `titre_section.dart` comme exemple :

```dart
// +-------------------------------------------+
// | 1. IMPORT                                 |
// +-------------------------------------------+
import 'package:flutter/material.dart';  // <- On a besoin de Flutter


// +-------------------------------------------+
// | 2. COMMENTAIRE DE DESCRIPTION             |
// +-------------------------------------------+
/// Widget pour afficher un titre stylise
/// 
/// Exemple d'utilisation :
/// ```dart
/// TitreSection(titre: 'Mon Titre')
/// ```


// +-------------------------------------------+
// | 3. DECLARATION DE LA CLASSE               |
// +-------------------------------------------+
class TitreSection extends StatelessWidget {
  
  
  // +-----------------------------------------+
  // | 4. PARAMETRES (PROPRIETES)              |
  // +-----------------------------------------+
  final String titre;  // <- Ce que le widget recoit
  
  
  // +-----------------------------------------+
  // | 5. CONSTRUCTEUR                         |
  // +-----------------------------------------+
  const TitreSection({
    super.key,
    required this.titre,  // <- Parametre obligatoire
  });

  
  // +-----------------------------------------+
  // | 6. METHODE BUILD                        |
  // +-----------------------------------------+
  @override
  Widget build(BuildContext context) {
    return Text(              // <- Ce que le widget affiche
      titre,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      textAlign: TextAlign.center,
    );
  }
}
```

---

## Exemple Concret : Ajouter un Nouveau Widget

### Scenario

Vous voulez creer un widget qui affiche un message dans une boite verte.

### Etape 1 : Creer le fichier

Creer : `lib/widgets/ma_boite_verte.dart`

### Etape 2 : Ecrire le code

```dart
import 'package:flutter/material.dart';

/// Ma premiere boite verte !
class MaBoiteVerte extends StatelessWidget {
  final String message;
  
  const MaBoiteVerte({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.green,
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
```

### Etape 3 : Importer dans `home_page.dart`

```dart
// Ajouter en haut du fichier
import '../widgets/ma_boite_verte.dart';
```

### Etape 4 : Utiliser dans la page

```dart
// Dans la Column de PageAccueil
children: [
  TitreSection(titre: 'Bienvenue dans Flutter!'),
  SizedBox(height: 20),
  
  // <- Ajouter ici
  MaBoiteVerte(message: 'Bonjour tout le monde !'),
  SizedBox(height: 20),
  
  ContainerColore(...),
  // etc.
],
```

### Resultat

Votre boite verte apparait dans l'application !

---

## Diagramme des Imports

### Notation des Chemins

```
lib/
├── main.dart
├── pages/
│   └── home_page.dart
└── widgets/
    ├── titre_section.dart
    └── carte_info.dart
```

**Depuis `main.dart` :**
```dart
import 'pages/home_page.dart';         // <- Descendre dans pages/
```

**Depuis `home_page.dart` :**
```dart
import '../widgets/titre_section.dart'; // <- Remonter (..), puis descendre dans widgets/
```

**Depuis `titre_section.dart` vers `carte_info.dart` :**
```dart
import 'carte_info.dart';              // <- Meme dossier (widgets/)
```

### Regles Simples

```
.        = dossier actuel
..       = dossier parent (remonter d'un niveau)
../..    = grand-parent (remonter de deux niveaux)
```

**Exemples :**

```
home_page.dart -> titre_section.dart
Position : lib/pages/home_page.dart
Cible    : lib/widgets/titre_section.dart
Import   : '../widgets/titre_section.dart'
           
           v Decomposition :
           ..            -> Remonter a lib/
           widgets/      -> Descendre dans widgets/
           titre_section.dart -> Le fichier
```

---

## Concepts Cles

### 1. Widget Stateless

```
+--------------------------------------+
|    Stateless Widget                  |
|                                      |
|  +--------------------------------+  |
|  | Proprietes (final)             |  |
|  | - Ne changent JAMAIS           |  |
|  | - Definies a la creation       |  |
|  +--------------------------------+  |
|                                      |
|  +--------------------------------+  |
|  | Methode build()                |  |
|  | - Construit l'interface        |  |
|  | - Appelee par Flutter          |  |
|  +--------------------------------+  |
|                                      |
|  Exemple : Un panneau "STOP"         |
|  Le texte ne change jamais           |
+--------------------------------------+
```

### 2. Parametres Required

```dart
// MAUVAIS : Sans required : parametre optionnel
class Widget1 {
  final String? titre;  // peut etre null
  Widget1({this.titre});
}
Widget1()  // <- OK, titre sera null

// BON : Avec required : parametre obligatoire
class Widget2 {
  final String titre;  // ne peut pas etre null
  Widget2({required this.titre});
}
Widget2()  // <- ERREUR : titre manquant !
Widget2(titre: 'Ok')  // <- OK
```

### 3. Composition

```
         PageAccueil
              |
      +-------+-------+--------+---------+
      |       |       |        |         |
  Titre   Container  Row    Cards    Icones
                             |
                        +----+----+
                        |         |
                     Carte1    Carte2
```

**Principe :** Les gros widgets contiennent des petits widgets.

---

## Exercices Pratiques

### Exercice 1 : Lecture

1. Ouvrir `main.dart`
2. Trouver ou `PageAccueil` est utilisee
3. Trouver d'ou vient `PageAccueil` (quel import ?)

**Solution :**
```dart
// ligne ~8
import 'pages/home_page.dart';

// ligne ~20
home: const PageAccueil(),
```

### Exercice 2 : Navigation

Depuis `lib/widgets/section_row.dart`, ecrire l'import pour :

1. `carte_info.dart` (meme dossier)
2. `home_page.dart` (dossier pages/)

**Solutions :**
```dart
// 1. Meme dossier
import 'carte_info.dart';

// 2. Dossier pages/
import '../pages/home_page.dart';
```

### Exercice 3 : Creation

Creer un nouveau widget `MaBoiteRouge` qui :
- Affiche un texte en blanc
- Sur fond rouge
- Avec padding de 15px

**Solution :**
```dart
// Fichier : lib/widgets/ma_boite_rouge.dart

import 'package:flutter/material.dart';

class MaBoiteRouge extends StatelessWidget {
  final String texte;
  
  const MaBoiteRouge({
    super.key,
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.red,
      child: Text(
        texte,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
```

---

## Points de Controle

Vous avez compris si vous pouvez repondre OUI a :

- [ ] Je sais ce que fait `main.dart`
- [ ] Je comprends la difference entre `pages/` et `widgets/`
- [ ] Je sais ecrire un import relatif (`../`)
- [ ] Je peux creer un nouveau widget dans un nouveau fichier
- [ ] Je comprends `required` dans les parametres
- [ ] Je sais ce qu'est un Stateless Widget

---

## Ressources

### Structure du Projet

```
flutter-demo/
|
├── lib/ ........................... Code source Dart
|   ├── main.dart .................. Point d'entree
|   ├── pages/ ..................... Ecrans complets
|   └── widgets/ ................... Composants reutilisables
|
├── test/ .......................... Tests unitaires
├── pubspec.yaml ................... Configuration du projet
├── 00_ORDRE_DE_LECTURE.md ......... Guide de lecture
├── 01_README.md ................... Documentation principale
├── 02_GUIDE_DEBUTANT.md ........... Ce fichier
└── 03_STRUCTURE.md ................ Guide de structure (detaille)

```

### Commandes Utiles

```bash
# Lancer l'application
flutter run

# Verifier les erreurs
flutter analyze

# Formater le code
dart format lib/

# Nettoyer et rebuilder
flutter clean
flutter pub get
flutter run
```

---

## Felicitations !

Vous comprenez maintenant :
- La structure d'un projet Flutter
- Comment organiser le code en fichiers
- Comment les fichiers s'importent entre eux
- Comment creer et utiliser des widgets

**Prochaine etape :** Lisez 03_STRUCTURE.md pour approfondir !

Bon courage !


# Structure du Projet Flutter - Guide Pedagogique

## [03] Structure - Organisation du code

## Organisation des Fichiers

```
flutter-demo/
|
├── lib/                          # Code source de l'application
|   ├── main.dart                 # Point d'entree de l'application
|   |
|   ├── pages/                    # Pages completes de l'application
|   |   └── home_page.dart        # Page d'accueil
|   |
|   └── widgets/                  # Widgets reutilisables
|       ├── titre_section.dart    # Widget de titre
|       ├── container_colore.dart # Container decore
|       ├── section_row.dart      # Section avec Row
|       ├── section_cartes.dart   # Section de cartes
|       ├── carte_info.dart       # Carte individuelle
|       ├── section_icones.dart   # Section d'icones
|       └── bouton_decoratif.dart # Bouton avec gradient
|
├── test/                         # Tests unitaires
|   └── widget_test.dart
|
├── pubspec.yaml                  # Configuration et dependances
├── 00_ORDRE_DE_LECTURE.md        # Guide de lecture
├── 01_README.md                  # Documentation principale
├── 02_GUIDE_DEBUTANT.md          # Guide pour debutants
└── 03_STRUCTURE.md               # Ce fichier

```

---

## Principe d'Organisation

### 1. Un Fichier = Une Responsabilite

Chaque widget a son propre fichier. C'est plus facile a :
- Trouver
- Modifier
- Reutiliser
- Comprendre

### 2. Dossiers Thematiques

- **`lib/`** : Tout le code Dart
- **`lib/pages/`** : Les pages completes (ecrans)
- **`lib/widgets/`** : Les composants reutilisables

---

## Comprendre les Imports

### Dans `main.dart`

```dart
import 'package:flutter/material.dart';  // <- Import Flutter
import 'pages/home_page.dart';           // <- Import relatif (notre fichier)
```

**Types d'imports :**

1. **Import de package** : `package:flutter/material.dart`
   - Bibliotheques externes (Flutter, packages pub.dev)
   - Utilise `package:`

2. **Import relatif** : `pages/home_page.dart`
   - Nos propres fichiers dans le projet
   - Chemin relatif depuis le fichier actuel

### Dans `home_page.dart`

```dart
import 'package:flutter/material.dart';  // <- Flutter

// Imports relatifs (nos widgets)
import '../widgets/titre_section.dart';       // <- Remonter d'un dossier (..)
import '../widgets/container_colore.dart';
import '../widgets/section_row.dart';
// etc.
```

**Notation `..` :**
- `.` = dossier actuel
- `..` = dossier parent (remonter d'un niveau)

### Dans `section_cartes.dart`

```dart
import 'package:flutter/material.dart';  // <- Flutter
import 'carte_info.dart';                // <- Meme dossier (widgets/)
```

---

## Flux de Donnees

```
main.dart
  |
  +-> runApp(MonApplication)
  |
  └-> MonApplication
        |
        └-> MaterialApp
              |
              └-> home: PageAccueil
                    |
                    └-> (depuis pages/home_page.dart)
                          |
                          ├-> TitreSection        (widgets/titre_section.dart)
                          ├-> ContainerColore     (widgets/container_colore.dart)
                          ├-> SectionRow          (widgets/section_row.dart)
                          ├-> SectionCartes       (widgets/section_cartes.dart)
                          |     └-> CarteInfo     (widgets/carte_info.dart)
                          ├-> SectionIcones       (widgets/section_icones.dart)
                          └-> BoutonDecoratif     (widgets/bouton_decoratif.dart)
```

---

## Explication Fichier par Fichier

### 1. `main.dart` - Point d'Entree

**Role :** Lancer l'application

```dart
void main() {          // <- Fonction principale (obligatoire)
  runApp(             // <- Lance l'app Flutter
    MonApplication()  // <- Widget racine
  );
}
```

**Contient :**
- `main()` : fonction de demarrage
- `MonApplication` : widget racine avec MaterialApp

**Import necessaire :**
- `pages/home_page.dart` pour utiliser PageAccueil

---

### 2. `pages/home_page.dart` - Page Principale

**Role :** Structure de la page d'accueil

**Contient :**
- `PageAccueil` : widget de la page
- Scaffold avec AppBar, Body, FloatingActionButton
- Composition de tous les widgets

**Imports necessaires :**
- Tous les widgets personnalises depuis `../widgets/`

---

### 3. `widgets/titre_section.dart` - Widget Simple

**Role :** Afficher un titre stylise

**Parametres :**
- `titre` : String (le texte a afficher)

**Exemple d'utilisation :**
```dart
TitreSection(titre: 'Mon Titre')
```

**Pas d'import supplementaire** (seulement Flutter)

---

### 4. `widgets/container_colore.dart` - Widget avec Style

**Role :** Container decore avec couleur, bordure, ombre

**Parametres :**
- `couleur` : Color
- `texte` : String

**Montre :**
- BoxDecoration
- BorderRadius
- BoxShadow

---

### 5. `widgets/section_row.dart` - Widget Layout

**Role :** Demontrer la disposition horizontale (Row)

**Parametres :** Aucun

**Montre :**
- Row avec MainAxisAlignment
- Methode privee `_buildBox()`

---

### 6. `widgets/section_cartes.dart` - Widget Composite

**Role :** Grouper plusieurs CarteInfo

**Parametres :** Aucun

**Import necessaire :**
- `carte_info.dart` (meme dossier)

**Montre :**
- Comment un widget utilise un autre widget personnalise

---

### 7. `widgets/carte_info.dart` - Widget Parametre

**Role :** Carte Material Design reutilisable

**Parametres :**
- `titre` : String
- `sousTitre` : String
- `icone` : IconData
- `couleurIcone` : Color

**Montre :**
- Card et ListTile
- Plusieurs parametres required

---

### 8. `widgets/section_icones.dart` - Widget avec Methode

**Role :** Afficher des icones avec labels

**Parametres :** Aucun

**Montre :**
- Row avec Column imbriquees
- Methode privee reutilisee

---

### 9. `widgets/bouton_decoratif.dart` - Widget Avance

**Role :** Bouton avec gradient et effet tactile

**Parametres :**
- `texte` : String

**Montre :**
- Empilement de widgets (Container > Material > InkWell)
- LinearGradient
- Effet d'ondulation

---

## Concepts Pedagogiques

### A. Separation des Responsabilites

**Avant (1 fichier) :**
```
main.dart (368 lignes) - MAUVAIS
  - main()
  - MonApplication
  - PageAccueil
  - TitreSection
  - ContainerColore
  - SectionRow
  - SectionCartes
  - CarteInfo
  - SectionIcones
  - BoutonDecoratif
```

**Apres (9 fichiers) :**
```
main.dart (33 lignes) - BON
pages/home_page.dart (70 lignes) - BON
widgets/titre_section.dart (35 lignes) - BON
widgets/container_colore.dart (60 lignes) - BON
widgets/section_row.dart (70 lignes) - BON
widgets/section_cartes.dart (50 lignes) - BON
widgets/carte_info.dart (65 lignes) - BON
widgets/section_icones.dart (70 lignes) - BON
widgets/bouton_decoratif.dart (80 lignes) - BON
```

### B. Reutilisabilite

Un widget dans un fichier separe peut etre utilise partout :

```dart
// Dans page1.dart
import '../widgets/titre_section.dart';
TitreSection(titre: 'Page 1')

// Dans page2.dart
import '../widgets/titre_section.dart';
TitreSection(titre: 'Page 2')

// Dans dialog.dart
import '../widgets/titre_section.dart';
TitreSection(titre: 'Dialogue')
```

### C. Facilite de Maintenance

Pour modifier le style de tous les titres :
- BON : Modifier 1 fichier (`widgets/titre_section.dart`)
- MAUVAIS : Chercher et modifier dans tout le projet

---

## Comment Ajouter un Nouveau Widget

### Etape 1 : Creer le fichier

```
lib/widgets/mon_nouveau_widget.dart
```

### Etape 2 : Ecrire le widget

```dart
import 'package:flutter/material.dart';

class MonNouveauWidget extends StatelessWidget {
  final String monParam;
  
  const MonNouveauWidget({
    super.key,
    required this.monParam,
  });

  @override
  Widget build(BuildContext context) {
    return Text(monParam);
  }
}
```

### Etape 3 : Importer et utiliser

Dans `home_page.dart` :

```dart
// Ajouter l'import
import '../widgets/mon_nouveau_widget.dart';

// Utiliser dans la Column
MonNouveauWidget(monParam: 'Valeur'),
```

---

## Bonnes Pratiques

### 1. Nommage des Fichiers

- BON : `titre_section.dart` (snake_case)
- MAUVAIS : `TitreSection.dart` (PascalCase)
- MAUVAIS : `titreSection.dart` (camelCase)

**Regle Flutter :** Fichiers en snake_case, Classes en PascalCase

### 2. Nommage des Classes

```dart
// BON : correspond au fichier
// Fichier : titre_section.dart
class TitreSection extends StatelessWidget { ... }

// MAUVAIS : ne correspond pas
// Fichier : titre_section.dart
class MonTitre extends StatelessWidget { ... }
```

### 3. Organisation des Imports

```dart
// 1. Imports Flutter (package:flutter)
import 'package:flutter/material.dart';

// 2. Imports packages externes (package:xxx)
import 'package:http/http.dart';

// 3. Imports relatifs (nos fichiers)
import '../widgets/titre_section.dart';
import 'carte_info.dart';
```

### 4. Commentaires

Chaque fichier devrait avoir :
- Un commentaire de description au debut
- Des commentaires pour les parametres
- Des exemples d'utilisation

---

## Exercices pour Etudiants

### Niveau 1 : Comprendre

1. Ouvrir `main.dart` et identifier ou PageAccueil est importee
2. Tracer le chemin : main() -> MonApplication -> PageAccueil -> TitreSection
3. Compter combien de fichiers importent `package:flutter/material.dart`

### Niveau 2 : Modifier

1. Changer la couleur du ContainerColore dans home_page.dart
2. Ajouter une 3eme CarteInfo dans section_cartes.dart
3. Modifier le texte du BoutonDecoratif

### Niveau 3 : Creer

1. Creer un nouveau widget `widgets/ma_box.dart`
2. L'importer dans `home_page.dart`
3. L'ajouter dans la Column de la page

### Niveau 4 : Organiser

1. Creer un dossier `lib/pages/` avec une nouvelle page
2. Creer un widget pour naviguer vers cette page
3. Tester la navigation

---

## Questions Frequentes

### Q : Pourquoi separer en plusieurs fichiers ?

**R :** Pour la meme raison qu'on range ses affaires dans differents tiroirs plutot que tout jeter dans un seul tiroir geant !

### Q : Combien de widgets par fichier ?

**R :** Generalement 1 widget public par fichier. Mais on peut avoir des widgets/methodes privees (avec `_`) dans le meme fichier.

### Q : Quelle est la difference entre pages/ et widgets/ ?

**R :**
- **pages/** : Ecrans complets de l'application
- **widgets/** : Composants reutilisables

### Q : Dois-je toujours utiliser `const` ?

**R :** Oui, quand c'est possible ! `const` optimise les performances en reutilisant les memes instances.

### Q : Comment savoir quel import utiliser ?

**R :**
- Meme dossier : `import 'fichier.dart';`
- Dossier parent : `import '../fichier.dart';`
- Sous-dossier : `import 'dossier/fichier.dart';`

---

## Points Cles a Retenir

1. **Un fichier = Une responsabilite** : Chaque widget dans son fichier
2. **Import relatif** : `../` pour remonter, pas de `../` pour meme dossier
3. **Organisation** : pages/ pour les ecrans, widgets/ pour les composants
4. **Reutilisabilite** : Un widget = un fichier = facile a reutiliser
5. **Maintenance** : Modifier un widget = modifier un seul fichier

---

## Pour Aller Plus Loin

1. Creer de nouvelles pages
2. Ajouter plus de widgets personnalises
3. Creer des dossiers thematiques (ex: `widgets/buttons/`, `widgets/cards/`)
4. Apprendre les Stateful Widgets
5. Decouvrir la navigation entre pages

**Felicitations !** Vous comprenez maintenant comment structurer un vrai projet Flutter !

**Prochaine etape :** Consultez 04_ARBORESCENCE.txt pour une vue d'ensemble visuelle !


# Projet Flutter - Démonstration Stateless Widgets

## Description
Projet de démonstration Flutter utilisant uniquement des **Stateless Widgets** pour enseigner les bases de Flutter aux étudiants.

## Composants Graphiques Inclus

### 1. **Widgets de Base**
- `Text` - Affichage de texte stylisé
- `Container` - Conteneurs avec couleurs et décorations
- `Icon` - Icônes Material Design

### 2. **Widgets de Layout**
- `Column` - Disposition verticale
- `Row` - Disposition horizontale
- `SingleChildScrollView` - Zone défilante

### 3. **Widgets Material**
- `AppBar` - Barre d'application
- `Card` - Cartes avec élévation
- `ListTile` - Éléments de liste
- `FloatingActionButton` - Bouton d'action flottant

### 4. **Widgets Personnalisés (Stateless)**
- `TitreSection` - Titre stylisé
- `ContainerColore` - Container avec ombre et bordure arrondie
- `SectionRow` - Démonstration de layout horizontal
- `CarteInfo` - Carte personnalisée avec icône
- `SectionIcones` - Collection d'icônes avec labels
- `BoutonDecoratif` - Bouton avec gradient et ombre

## Structure du Code

```
lib/
  └── main.dart  - Fichier principal avec tous les widgets
```

## Comment Exécuter

1. Assurez-vous d'avoir Flutter installé
2. Ouvrez un terminal dans le dossier du projet
3. Exécutez :
```bash
flutter pub get
flutter run
```

## Concepts Pédagogiques

### Stateless Widgets
Tous les widgets de ce projet sont **stateless**, c'est-à-dire qu'ils sont immuables et ne changent pas d'état. Ils sont parfaits pour :
- Afficher des informations statiques
- Créer des composants réutilisables
- Comprendre la composition de widgets

### Points Clés pour les Étudiants
1. **Composition** : Les widgets Flutter sont composables
2. **Paramètres** : Utilisation de `required` pour les paramètres obligatoires
3. **Styling** : Utilisation de `TextStyle`, `BoxDecoration`, etc.
4. **Layout** : `Row`, `Column`, `Padding`, `SizedBox`
5. **Material Design** : Utilisation des composants Material

## Personnalisation

Les étudiants peuvent modifier :
- Les couleurs dans les widgets
- Les textes affichés
- Les icônes utilisées
- Ajouter de nouveaux widgets stateless

## Licence

Projet éducatif libre d'utilisation.


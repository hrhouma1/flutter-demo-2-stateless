import 'package:flutter/material.dart';

// Import de tous nos widgets personnalisés
import '../widgets/titre_section.dart';
import '../widgets/container_colore.dart';
import '../widgets/section_row.dart';
import '../widgets/section_cartes.dart';
import '../widgets/section_icones.dart';
import '../widgets/bouton_decoratif.dart';

/// Page d'accueil avec plusieurs composants graphiques (Stateless)
/// Cette classe est dans un fichier séparé pour une meilleure organisation
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre supérieure de l'application
      appBar: AppBar(
        title: const Text('Démonstration Stateless Widgets'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      
      // Corps principal de la page
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Titre principal
            // Widget importé depuis widgets/titre_section.dart
            const TitreSection(titre: 'Bienvenue dans Flutter!'),
            
            const SizedBox(height: 20),
            
            // 2. Container coloré
            // Widget importé depuis widgets/container_colore.dart
            const ContainerColore(
              couleur: Colors.blue,
              texte: 'Container avec fond bleu',
            ),
            
            const SizedBox(height: 20),
            
            // 3. Section avec Row
            // Widget importé depuis widgets/section_row.dart
            const SectionRow(),
            
            const SizedBox(height: 20),
            
            // 4. Section avec Cards
            // Widget importé depuis widgets/section_cartes.dart
            const SectionCartes(),
            
            const SizedBox(height: 20),
            
            // 5. Section avec icônes
            // Widget importé depuis widgets/section_icones.dart
            const SectionIcones(),
            
            const SizedBox(height: 20),
            
            // 6. Bouton décoratif
            // Widget importé depuis widgets/bouton_decoratif.dart
            const BoutonDecoratif(texte: 'Bouton Exemple'),
          ],
        ),
      ),
      
      // Bouton flottant en bas à droite
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action lors du clic (vide pour l'instant)
        },
        tooltip: 'Action',
        child: const Icon(Icons.add),
      ),
    );
  }
}


import 'package:flutter/material.dart';
// Import du widget CarteInfo depuis un autre fichier
import 'carte_info.dart';

/// Section avec des cartes (Stateless)
/// 
/// Ce widget regroupe plusieurs CarteInfo pour créer une section.
/// Il montre comment un widget peut utiliser d'autres widgets personnalisés.
class SectionCartes extends StatelessWidget {
  const SectionCartes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label de la section
        const Text(
          'Exemples de Cards:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Première carte
        // CarteInfo est importée depuis carte_info.dart
        const CarteInfo(
          titre: 'Carte 1',
          sousTitre: 'Description de la carte 1',
          icone: Icons.star,
          couleurIcone: Colors.amber,
        ),
        
        const SizedBox(height: 10),
        
        // Deuxième carte avec des paramètres différents
        const CarteInfo(
          titre: 'Carte 2',
          sousTitre: 'Description de la carte 2',
          icone: Icons.favorite,
          couleurIcone: Colors.red,
        ),
      ],
    );
  }
}


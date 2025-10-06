import 'package:flutter/material.dart';

/// Section avec des icônes (Stateless)
/// 
/// Ce widget montre comment créer une rangée d'icônes
/// avec des labels en dessous de chaque icône.
/// 
/// Chaque icône est dans une Column (vertical) et
/// toutes les Columns sont dans une Row (horizontal).
class SectionIcones extends StatelessWidget {
  const SectionIcones({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label de la section
        const Text(
          'Collection d\'icônes:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Row contenant 4 groupes icône+label
        Row(
          // spaceAround : espace autour de chaque élément
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIconeAvecLabel(Icons.home, 'Home', Colors.blue),
            _buildIconeAvecLabel(Icons.person, 'Profil', Colors.green),
            _buildIconeAvecLabel(Icons.settings, 'Paramètres', Colors.grey),
            _buildIconeAvecLabel(Icons.notifications, 'Alertes', Colors.orange),
          ],
        ),
      ],
    );
  }

  /// Méthode privée pour construire une icône avec son label
  /// 
  /// Retourne une Column contenant :
  /// - L'icône en haut
  /// - Le texte en bas
  Widget _buildIconeAvecLabel(IconData icone, String label, Color couleur) {
    return Column(
      children: [
        // Icône
        Icon(
          icone,
          size: 40,
          color: couleur,
        ),
        
        const SizedBox(height: 5),
        
        // Label sous l'icône
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}


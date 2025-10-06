import 'package:flutter/material.dart';

/// Section démontrant l'utilisation de Row (Stateless)
/// 
/// Ce widget montre comment disposer des éléments horizontalement
/// en utilisant le widget Row.
/// 
/// Row = disposition horizontale (de gauche à droite)
/// Column = disposition verticale (de haut en bas)
class SectionRow extends StatelessWidget {
  const SectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label explicatif
        const Text(
          'Exemple de Row (disposition horizontale):',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Row : les widgets sont disposés horizontalement
        Row(
          // spaceEvenly : espace égal entre chaque élément
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBox(Colors.red, 'Box 1'),
            _buildBox(Colors.green, 'Box 2'),
            _buildBox(Colors.orange, 'Box 3'),
          ],
        ),
      ],
    );
  }

  /// Méthode privée pour construire une boîte colorée
  /// Le '_' devant le nom indique que cette méthode est privée
  /// (utilisable seulement dans cette classe)
  Widget _buildBox(Color couleur, String texte) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          texte,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


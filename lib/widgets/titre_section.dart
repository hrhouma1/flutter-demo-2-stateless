import 'package:flutter/material.dart';

/// Widget pour afficher un titre stylisé (Stateless)
/// 
/// Ce widget est réutilisable : on peut l'utiliser partout
/// en changeant simplement le texte du titre.
/// 
/// Exemple d'utilisation :
/// ```dart
/// TitreSection(titre: 'Mon Titre')
/// ```
class TitreSection extends StatelessWidget {
  // Paramètre : le texte du titre
  // 'final' signifie que cette valeur ne peut pas changer (immuable)
  final String titre;
  
  // Constructeur avec paramètre obligatoire (required)
  const TitreSection({
    super.key,
    required this.titre,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titre,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      textAlign: TextAlign.center,
    );
  }
}


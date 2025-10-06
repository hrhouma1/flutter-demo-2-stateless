import 'package:flutter/material.dart';

/// Widget Carte personnalisée (Stateless)
/// 
/// Ce widget représente une carte Material Design avec :
/// - Une icône à gauche (leading)
/// - Un titre en gras
/// - Un sous-titre
/// - Une flèche à droite (trailing)
/// 
/// C'est un bon exemple de widget réutilisable avec plusieurs paramètres.
/// 
/// Exemple d'utilisation :
/// ```dart
/// CarteInfo(
///   titre: 'Mon titre',
///   sousTitre: 'Mon sous-titre',
///   icone: Icons.home,
///   couleurIcone: Colors.blue,
/// )
/// ```
class CarteInfo extends StatelessWidget {
  // Tous les paramètres de ce widget (immuables)
  final String titre;
  final String sousTitre;
  final IconData icone;
  final Color couleurIcone;
  
  // Constructeur avec tous les paramètres obligatoires
  const CarteInfo({
    super.key,
    required this.titre,
    required this.sousTitre,
    required this.icone,
    required this.couleurIcone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation : hauteur de l'ombre (effet de profondeur)
      elevation: 4,
      
      child: ListTile(
        // Icône à gauche
        leading: Icon(
          icone,
          color: couleurIcone,
          size: 40,
        ),
        
        // Titre principal
        title: Text(
          titre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        
        // Sous-titre (texte secondaire)
        subtitle: Text(sousTitre),
        
        // Icône à droite (flèche)
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}


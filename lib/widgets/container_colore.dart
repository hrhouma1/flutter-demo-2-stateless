import 'package:flutter/material.dart';

/// Widget Container avec couleur personnalisée (Stateless)
/// 
/// Ce widget montre comment créer un container décoré avec :
/// - Une couleur de fond
/// - Des coins arrondis (borderRadius)
/// - Une ombre (boxShadow)
/// 
/// Exemple d'utilisation :
/// ```dart
/// ContainerColore(
///   couleur: Colors.red,
///   texte: 'Mon texte',
/// )
/// ```
class ContainerColore extends StatelessWidget {
  // Paramètres du widget (tous immuables avec 'final')
  final Color couleur;
  final String texte;
  
  // Constructeur avec paramètres obligatoires
  const ContainerColore({
    super.key,
    required this.couleur,
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      
      // BoxDecoration permet de décorer le Container
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.circular(15),
        
        // BoxShadow crée une ombre portée
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Décalage de l'ombre
          ),
        ],
      ),
      
      // Contenu du container
      child: Text(
        texte,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}


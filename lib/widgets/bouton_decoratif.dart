import 'package:flutter/material.dart';

/// Bouton décoratif avec gradient (Stateless)
/// 
/// Ce widget montre une technique avancée : empilement de plusieurs
/// widgets pour créer un effet visuel complexe.
/// 
/// Couches (de l'extérieur vers l'intérieur) :
/// 1. Container : décoration (gradient, ombre, bordure)
/// 2. Material : surface Material Design
/// 3. InkWell : zone cliquable avec effet d'ondulation
/// 4. Padding : espacement interne
/// 5. Text : contenu textuel
/// 
/// Exemple d'utilisation :
/// ```dart
/// BoutonDecoratif(texte: 'Cliquez ici')
/// ```
class BoutonDecoratif extends StatelessWidget {
  // Paramètre : le texte du bouton
  final String texte;
  
  const BoutonDecoratif({
    super.key,
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Décoration du container
      decoration: BoxDecoration(
        // Gradient : dégradé de couleurs
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        
        // BorderRadius : coins arrondis (forme de pilule)
        borderRadius: BorderRadius.circular(30),
        
        // BoxShadow : ombre portée
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      
      // Material : nécessaire pour l'effet InkWell
      child: Material(
        color: Colors.transparent, // Transparent pour voir le gradient
        
        // InkWell : rend le widget cliquable avec effet d'ondulation
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            // Action lors du clic (vide pour l'instant)
            // print('Bouton cliqué !');
          },
          
          // Padding : espacement interne
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            
            // Contenu : le texte du bouton
            child: Center(
              child: Text(
                texte,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


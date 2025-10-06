import 'package:flutter/material.dart';
// Import de la page d'accueil depuis un autre fichier
import 'pages/home_page.dart';

/// Point d'entrée de l'application Flutter
/// Cette fonction main() est appelée au démarrage de l'app
void main() {
  runApp(const MonApplication());
}

/// Widget racine de l'application (Stateless)
/// C'est le premier widget qui est créé
class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuration de l'application
      title: 'Démonstration Flutter',
      debugShowCheckedModeBanner: false,
      
      // Définition du thème global de l'app
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      
      // Page d'accueil de l'application
      // PageAccueil est importée depuis pages/home_page.dart
      home: const PageAccueil(),
    );
  }
}

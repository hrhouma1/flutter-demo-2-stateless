import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

/// Widget principal de l'application (Stateless)
class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Démonstration Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PageAccueil(),
    );
  }
}

/// Page d'accueil avec plusieurs composants graphiques (Stateless)
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Démonstration Stateless Widgets'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Titre principal
            const TitreSection(titre: 'Bienvenue dans Flutter!'),
            
            const SizedBox(height: 20),
            
            // Section avec container coloré
            const ContainerColore(
              couleur: Colors.blue,
              texte: 'Container avec fond bleu',
            ),
            
            const SizedBox(height: 20),
            
            // Section avec Row
            const SectionRow(),
            
            const SizedBox(height: 20),
            
            // Section avec Cards
            const SectionCartes(),
            
            const SizedBox(height: 20),
            
            // Section avec icônes
            const SectionIcones(),
            
            const SizedBox(height: 20),
            
            // Bouton décoratif
            const BoutonDecoratif(texte: 'Bouton Exemple'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Action',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Widget pour afficher un titre (Stateless)
class TitreSection extends StatelessWidget {
  final String titre;
  
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

/// Widget Container avec couleur personnalisée (Stateless)
class ContainerColore extends StatelessWidget {
  final Color couleur;
  final String texte;
  
  const ContainerColore({
    super.key,
    required this.couleur,
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
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

/// Section démontrant l'utilisation de Row (Stateless)
class SectionRow extends StatelessWidget {
  const SectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exemple de Row (disposition horizontale):',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
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

/// Section avec des cartes (Stateless)
class SectionCartes extends StatelessWidget {
  const SectionCartes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exemples de Cards:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const CarteInfo(
          titre: 'Carte 1',
          sousTitre: 'Description de la carte 1',
          icone: Icons.star,
          couleurIcone: Colors.amber,
        ),
        const SizedBox(height: 10),
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

/// Widget Carte personnalisée (Stateless)
class CarteInfo extends StatelessWidget {
  final String titre;
  final String sousTitre;
  final IconData icone;
  final Color couleurIcone;
  
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
      elevation: 4,
      child: ListTile(
        leading: Icon(
          icone,
          color: couleurIcone,
          size: 40,
        ),
        title: Text(
          titre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(sousTitre),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

/// Section avec des icônes (Stateless)
class SectionIcones extends StatelessWidget {
  const SectionIcones({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Collection d\'icônes:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
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

  Widget _buildIconeAvecLabel(IconData icone, String label, Color couleur) {
    return Column(
      children: [
        Icon(
          icone,
          size: 40,
          color: couleur,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

/// Bouton décoratif (Stateless)
class BoutonDecoratif extends StatelessWidget {
  final String texte;
  
  const BoutonDecoratif({
    super.key,
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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


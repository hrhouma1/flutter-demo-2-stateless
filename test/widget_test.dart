// Test de base pour l'application de démonstration Flutter

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_demo/main.dart';

void main() {
  testWidgets('Test de base de l\'application', (WidgetTester tester) async {
    // Construit l'application et affiche un frame.
    await tester.pumpWidget(const MonApplication());

    // Vérifie que le titre est présent.
    expect(find.text('Bienvenue dans Flutter!'), findsOneWidget);
    
    // Vérifie que le FloatingActionButton est présent.
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}

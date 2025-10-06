# Diagrammes Mermaid - Architecture Flutter

## 1. Vue d'ensemble de l'Application

```mermaid
graph TD
    A[main] -->|runApp| B[MonApplication]
    B -->|MaterialApp| C[PageAccueil]
    C -->|Scaffold| D[Structure de Page]
    
    D --> E[AppBar]
    D --> F[Body]
    D --> G[FloatingActionButton]
    
    E --> E1[Text: Démonstration Stateless Widgets]
    
    F --> H[SingleChildScrollView]
    H --> I[Column]
    
    I --> J1[TitreSection]
    I --> J2[ContainerColore]
    I --> J3[SectionRow]
    I --> J4[SectionCartes]
    I --> J5[SectionIcones]
    I --> J6[BoutonDecoratif]
    
    G --> G1[Icon: add]
    
    style A fill:#ff9999
    style B fill:#ffcc99
    style C fill:#ffff99
    style D fill:#99ccff
    style F fill:#99ff99
```

## 2. Hiérarchie Complète des Widgets

```mermaid
graph TB
    Main[main.dart]
    
    Main --> App[MonApplication<br/>StatelessWidget]
    App --> MatApp[MaterialApp]
    MatApp --> Page[PageAccueil<br/>StatelessWidget]
    
    Page --> Scaffold[Scaffold]
    
    Scaffold --> AppBar[AppBar]
    Scaffold --> Body[body]
    Scaffold --> FAB[floatingActionButton]
    
    AppBar --> AppBarText[Text]
    
    Body --> Scroll[SingleChildScrollView<br/>padding: 16px]
    
    Scroll --> Col[Column<br/>crossAxisAlignment: stretch]
    
    Col --> W1[TitreSection<br/>titre: 'Bienvenue...']
    Col --> Space1[SizedBox height:20]
    Col --> W2[ContainerColore<br/>couleur: blue]
    Col --> Space2[SizedBox height:20]
    Col --> W3[SectionRow]
    Col --> Space3[SizedBox height:20]
    Col --> W4[SectionCartes]
    Col --> Space4[SizedBox height:20]
    Col --> W5[SectionIcones]
    Col --> Space5[SizedBox height:20]
    Col --> W6[BoutonDecoratif]
    
    W1 --> W1T[Text<br/>fontSize:28, bold, blue]
    
    W2 --> W2C[Container<br/>BorderRadius, Shadow]
    W2C --> W2T[Text<br/>white, 18px]
    
    W3 --> W3Col[Column]
    W3Col --> W3Label[Text: 'Exemple de Row...']
    W3Col --> W3Row[Row<br/>spaceEvenly]
    W3Row --> Box1[Container<br/>100x100 red]
    W3Row --> Box2[Container<br/>100x100 green]
    W3Row --> Box3[Container<br/>100x100 orange]
    
    W4 --> W4Col[Column]
    W4Col --> W4Label[Text: 'Exemples de Cards']
    W4Col --> Card1[CarteInfo<br/>Carte 1, star, amber]
    W4Col --> Card2[CarteInfo<br/>Carte 2, favorite, red]
    
    Card1 --> Card1W[Card elevation:4]
    Card1W --> Tile1[ListTile]
    Tile1 --> Lead1[Icon leading]
    Tile1 --> Title1[Text title]
    Tile1 --> Sub1[Text subtitle]
    Tile1 --> Trail1[Icon trailing]
    
    W5 --> W5Col[Column]
    W5Col --> W5Label[Text: 'Collection d'icônes']
    W5Col --> W5Row[Row<br/>spaceAround]
    W5Row --> Icon1[Icon Home<br/>blue]
    W5Row --> Icon2[Icon Person<br/>green]
    W5Row --> Icon3[Icon Settings<br/>grey]
    W5Row --> Icon4[Icon Notifications<br/>orange]
    
    W6 --> W6Cont[Container<br/>Gradient + Shadow]
    W6Cont --> W6Mat[Material transparent]
    W6Mat --> W6Ink[InkWell]
    W6Ink --> W6Pad[Padding]
    W6Pad --> W6Text[Text: 'Bouton Exemple']
    
    FAB --> FABIcon[Icon: add]
    
    style App fill:#ffcccc
    style Page fill:#ffffcc
    style W1 fill:#ccffcc
    style W2 fill:#ccffcc
    style W3 fill:#ccffcc
    style W4 fill:#ccffcc
    style W5 fill:#ccffcc
    style W6 fill:#ccffcc
```

## 3. Disposition Layout - Column et Row

```mermaid
graph TB
    subgraph "PageAccueil - Column (Vertical)"
        direction TB
        T1[TitreSection<br/>📝 Bienvenue dans Flutter!]
        S1[⬇️ SizedBox 20px]
        T2[ContainerColore<br/>🔵 Container avec fond bleu]
        S2[⬇️ SizedBox 20px]
        T3[SectionRow<br/>📦 Disposition horizontale]
        S3[⬇️ SizedBox 20px]
        T4[SectionCartes<br/>🎴 Cards]
        S4[⬇️ SizedBox 20px]
        T5[SectionIcones<br/>🎨 Icônes]
        S5[⬇️ SizedBox 20px]
        T6[BoutonDecoratif<br/>🔘 Bouton]
        
        T1 --> S1
        S1 --> T2
        T2 --> S2
        S2 --> T3
        T3 --> S3
        S3 --> T4
        T4 --> S4
        S4 --> T5
        T5 --> S5
        S5 --> T6
    end
    
    style T1 fill:#e3f2fd
    style T2 fill:#bbdefb
    style T3 fill:#90caf9
    style T4 fill:#64b5f6
    style T5 fill:#42a5f5
    style T6 fill:#2196f3
```

## 4. SectionRow - Disposition Horizontale

```mermaid
graph LR
    subgraph "SectionRow - Row (Horizontal)"
        direction LR
        Label[Text:<br/>Exemple de Row...]
        
        subgraph RowLayout["Row (MainAxisAlignment.spaceEvenly)"]
            direction LR
            Space1[⬅️ espace ➡️]
            Box1[Container<br/>🔴 Box 1<br/>100x100 red]
            Space2[⬅️ espace ➡️]
            Box2[Container<br/>🟢 Box 2<br/>100x100 green]
            Space3[⬅️ espace ➡️]
            Box3[Container<br/>🟠 Box 3<br/>100x100 orange]
            Space4[⬅️ espace ➡️]
            
            Space1 -.-> Box1
            Box1 -.-> Space2
            Space2 -.-> Box2
            Box2 -.-> Space3
            Space3 -.-> Box3
            Box3 -.-> Space4
        end
    end
    
    style Box1 fill:#ffcdd2
    style Box2 fill:#c8e6c9
    style Box3 fill:#ffe0b2
```

## 5. SectionCartes - Structure des Cards

```mermaid
graph TB
    subgraph "SectionCartes"
        Label[Text: Exemples de Cards]
        
        subgraph Carte1["CarteInfo 1"]
            Card1[Card elevation:4]
            Card1 --> Tile1[ListTile]
            
            Tile1 --> L1[leading:<br/>⭐ Icon star<br/>amber, 40px]
            Tile1 --> T1[title:<br/>Carte 1<br/>bold]
            Tile1 --> S1[subtitle:<br/>Description<br/>de la carte 1]
            Tile1 --> Tr1[trailing:<br/>▶ arrow_forward_ios]
        end
        
        subgraph Carte2["CarteInfo 2"]
            Card2[Card elevation:4]
            Card2 --> Tile2[ListTile]
            
            Tile2 --> L2[leading:<br/>❤️ Icon favorite<br/>red, 40px]
            Tile2 --> T2[title:<br/>Carte 2<br/>bold]
            Tile2 --> S2[subtitle:<br/>Description<br/>de la carte 2]
            Tile2 --> Tr2[trailing:<br/>▶ arrow_forward_ios]
        end
        
        Label --> Carte1
        Carte1 --> Carte2
    end
    
    style Carte1 fill:#fff9c4
    style Carte2 fill:#fff9c4
    style Card1 fill:#ffffff
    style Card2 fill:#ffffff
```

## 6. SectionIcones - Disposition des Icônes

```mermaid
graph LR
    subgraph "SectionIcones - Row (spaceAround)"
        direction LR
        
        S1[espace]
        
        subgraph Icon1["Column"]
            I1[🏠<br/>Icon home<br/>blue, 40px]
            T1[Home<br/>12px]
            I1 --> T1
        end
        
        S2[espace]
        
        subgraph Icon2["Column"]
            I2[👤<br/>Icon person<br/>green, 40px]
            T2[Profil<br/>12px]
            I2 --> T2
        end
        
        S3[espace]
        
        subgraph Icon3["Column"]
            I3[⚙️<br/>Icon settings<br/>grey, 40px]
            T3[Paramètres<br/>12px]
            I3 --> T3
        end
        
        S4[espace]
        
        subgraph Icon4["Column"]
            I4[🔔<br/>Icon notifications<br/>orange, 40px]
            T4[Alertes<br/>12px]
            I4 --> T4
        end
        
        S5[espace]
        
        S1 -.-> Icon1
        Icon1 -.-> S2
        S2 -.-> Icon2
        Icon2 -.-> S3
        S3 -.-> Icon3
        Icon3 -.-> S4
        S4 -.-> Icon4
        Icon4 -.-> S5
    end
    
    style Icon1 fill:#e3f2fd
    style Icon2 fill:#e8f5e9
    style Icon3 fill:#f5f5f5
    style Icon4 fill:#fff3e0
```

## 7. BoutonDecoratif - Architecture en Couches

```mermaid
graph TB
    subgraph "BoutonDecoratif - Layers"
        Layer1[Container<br/>📦 Couche 1]
        Layer1Desc[BoxDecoration:<br/>- LinearGradient: blue→purple<br/>- BorderRadius: 30px<br/>- BoxShadow: blue shadow]
        
        Layer2[Material<br/>🎨 Couche 2]
        Layer2Desc[color: transparent]
        
        Layer3[InkWell<br/>👆 Couche 3]
        Layer3Desc[onTap: <br/>borderRadius: 30px<br/>effet d'ondulation]
        
        Layer4[Padding<br/>📏 Couche 4]
        Layer4Desc[horizontal: 40px<br/>vertical: 15px]
        
        Layer5[Text<br/>📝 Couche 5]
        Layer5Desc['Bouton Exemple'<br/>white, bold, 18px]
        
        Layer1 --> Layer1Desc
        Layer1 --> Layer2
        Layer2 --> Layer2Desc
        Layer2 --> Layer3
        Layer3 --> Layer3Desc
        Layer3 --> Layer4
        Layer4 --> Layer4Desc
        Layer4 --> Layer5
        Layer5 --> Layer5Desc
    end
    
    style Layer1 fill:#e1bee7
    style Layer2 fill:#ce93d8
    style Layer3 fill:#ba68c8
    style Layer4 fill:#ab47bc
    style Layer5 fill:#9c27b0
    style Layer5Desc fill:#ffffff,color:#000
```

## 8. Flux de Construction des Widgets

```mermaid
sequenceDiagram
    participant Main as main()
    participant App as MonApplication
    participant Mat as MaterialApp
    participant Page as PageAccueil
    participant Scaffold as Scaffold
    participant Body as Body Widgets
    
    Main->>App: runApp()
    App->>Mat: build(context)
    Mat->>Page: home: PageAccueil()
    Page->>Scaffold: build(context)
    
    Scaffold->>Scaffold: Créer AppBar
    Scaffold->>Body: Créer Body
    Scaffold->>Scaffold: Créer FAB
    
    Body->>Body: TitreSection.build()
    Body->>Body: ContainerColore.build()
    Body->>Body: SectionRow.build()
    Body->>Body: SectionCartes.build()
    Body->>Body: SectionIcones.build()
    Body->>Body: BoutonDecoratif.build()
    
    Body-->>Scaffold: Widget tree complet
    Scaffold-->>Page: Scaffold configuré
    Page-->>Mat: Page construite
    Mat-->>App: MaterialApp configuré
    App-->>Main: Application lancée ✓
```

## 9. Types de Widgets Utilisés

```mermaid
mindmap
  root((Widgets Flutter))
    Stateless Custom
      MonApplication
      PageAccueil
      TitreSection
      ContainerColore
      SectionRow
      SectionCartes
      CarteInfo
      SectionIcones
      BoutonDecoratif
    Material Design
      MaterialApp
      Scaffold
      AppBar
      Card
      ListTile
      FloatingActionButton
    Layout
      Column
      Row
      SingleChildScrollView
      Center
      Padding
    Basic
      Container
      Text
      Icon
      SizedBox
      Material
      InkWell
```

## 10. Paramètres et Props Flow

```mermaid
graph LR
    subgraph "Flux des Paramètres"
        Parent[PageAccueil]
        
        Parent -->|titre: String| W1[TitreSection]
        
        Parent -->|couleur: Color<br/>texte: String| W2[ContainerColore]
        
        Parent -->|Pas de paramètres| W3[SectionRow]
        
        Parent -->|Pas de paramètres| W4[SectionCartes]
        W4 -->|titre: String<br/>sousTitre: String<br/>icone: IconData<br/>couleurIcone: Color| C1[CarteInfo 1]
        W4 -->|titre: String<br/>sousTitre: String<br/>icone: IconData<br/>couleurIcone: Color| C2[CarteInfo 2]
        
        Parent -->|Pas de paramètres| W5[SectionIcones]
        
        Parent -->|texte: String| W6[BoutonDecoratif]
    end
    
    style Parent fill:#ffeb3b
    style W1 fill:#c8e6c9
    style W2 fill:#c8e6c9
    style W3 fill:#c8e6c9
    style W4 fill:#c8e6c9
    style W5 fill:#c8e6c9
    style W6 fill:#c8e6c9
    style C1 fill:#a5d6a7
    style C2 fill:#a5d6a7
```

## 11. Cycle de Vie des Stateless Widgets

```mermaid
stateDiagram-v2
    [*] --> Création: Widget instancié
    Création --> Build: build() appelé
    Build --> Rendu: Widget tree construit
    Rendu --> Affichage: Pixels sur l'écran
    
    Affichage --> Build: Parent change
    Affichage --> [*]: Widget détruit
    
    note right of Création
        const MonWidget({
          required this.data
        })
    end note
    
    note right of Build
        Widget build(BuildContext context) {
          return Container(...);
        }
    end note
    
    note right of Affichage
        Widget affiché à l'écran
        Pas de setState()
        Immuable
    end note
```

## 12. Architecture Visuelle de l'Écran

```mermaid
graph TB
    subgraph Screen["📱 Écran de l'Application"]
        subgraph AppBarZone["┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓<br/>┃ Démonstration Stateless Widgets ┃<br/>┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"]
        end
        
        subgraph ScrollZone["Zone Défilante (SingleChildScrollView)"]
            Zone1["<br/>Bienvenue dans Flutter!<br/>(Titre 28px, bleu, centré)<br/>"]
            
            Zone2["┌─────────────────────────────┐<br/>│ Container avec fond bleu    │<br/>│  (BorderRadius, Shadow)     │<br/>└─────────────────────────────┘"]
            
            Zone3["Exemple de Row:<br/>┌─────┐  ┌─────┐  ┌─────┐<br/>│Box 1│  │Box 2│  │Box 3│<br/>│ 🔴  │  │ 🟢  │  │ 🟠  │<br/>└─────┘  └─────┘  └─────┘"]
            
            Zone4["Exemples de Cards:<br/>┌──────────────────────────┐<br/>│ ⭐ Carte 1          ▶    │<br/>│    Description...        │<br/>└──────────────────────────┘<br/>┌──────────────────────────┐<br/>│ ❤️  Carte 2          ▶    │<br/>│    Description...        │<br/>└──────────────────────────┘"]
            
            Zone5["Collection d'icônes:<br/>🏠    👤    ⚙️    🔔<br/>Home Profil Param Alertes"]
            
            Zone6["┌────────────────────────┐<br/>│   Bouton Exemple       │<br/>│ (Gradient blue→purple) │<br/>└────────────────────────┘"]
        end
        
        FABZone["                    ┌─────┐<br/>                    │  +  │<br/>                    └─────┘"]
        
        AppBarZone --> Zone1
        Zone1 --> Zone2
        Zone2 --> Zone3
        Zone3 --> Zone4
        Zone4 --> Zone5
        Zone5 --> Zone6
    end
    
    style AppBarZone fill:#2196f3,color:#fff
    style Zone1 fill:#e3f2fd
    style Zone2 fill:#bbdefb
    style Zone3 fill:#90caf9
    style Zone4 fill:#64b5f6
    style Zone5 fill:#42a5f5
    style Zone6 fill:#2196f3,color:#fff
    style FABZone fill:#ff9800,color:#fff
```

## 13. Comparaison Row vs Column

```mermaid
graph TB
    subgraph Comparison["Comparaison Layout"]
        subgraph Col["Column (Vertical)"]
            direction TB
            C1[Widget 1]
            C2[Widget 2]
            C3[Widget 3]
            C1 --> C2
            C2 --> C3
            CLabel[mainAxis: vertical ⬇️<br/>crossAxis: horizontal ↔️]
        end
        
        subgraph RowG["Row (Horizontal)"]
            direction LR
            R1[Widget 1]
            R2[Widget 2]
            R3[Widget 3]
            R1 --> R2
            R2 --> R3
            RLabel[mainAxis: horizontal ➡️<br/>crossAxis: vertical ⬍]
        end
    end
    
    style C1 fill:#ffcdd2
    style C2 fill:#f8bbd0
    style C3 fill:#e1bee7
    style R1 fill:#c5cae9
    style R2 fill:#bbdefb
    style R3 fill:#b2ebf2
```

---

## Légende des Symboles

| Symbole | Signification |
|---------|--------------|
| 📱 | Application/Écran |
| 📦 | Container |
| 📝 | Text |
| 🎨 | Material/Style |
| 👆 | Interactive (InkWell) |
| 📏 | Padding/Spacing |
| ⬇️ | Direction verticale |
| ➡️ | Direction horizontale |
| 🔵 🔴 🟢 🟠 | Couleurs |
| ⭐ ❤️ 🏠 👤 ⚙️ 🔔 | Icônes |

---

## Comment Utiliser ces Diagrammes

1. **Pour comprendre la structure globale** : Voir diagrammes 1 et 2
2. **Pour comprendre les layouts** : Voir diagrammes 3, 4, 13
3. **Pour comprendre un widget spécifique** : Voir diagrammes 5, 6, 7
4. **Pour comprendre le flux de données** : Voir diagrammes 8, 10, 11
5. **Pour visualiser l'écran final** : Voir diagramme 12

Ces diagrammes peuvent être visualisés dans :
- GitHub (supporte Mermaid nativement)
- VS Code (avec extension Mermaid Preview)
- Sites web comme mermaid.live
- Documentation générée (GitBook, MkDocs, etc.)


# Fluttericon 

[![pub package](https://img.shields.io/pub/v/fluttericon.svg)](https://pub.dartlang.org/packages/fluttericon)

Flutter icon packs built from 15 popular free and open-source webfonts. These include all packs available from [FlutterIcon](https://fluttericon.com) (except Material Icons).

Please note this package is not intended for production use, due to the large size.  Instead, it can be used as a development aid to help identify/test icons.  

For production use, it is highly recommended to use [FlutterIcon](https://fluttericon.com) to customize your icon pack, limiting your icon font to needed icons and building your own from custom SVG.

## Included icon sets

The icon set included are:
  * Brandico
  * Elusive
  * Entypo
  * Font Awesome
  * Fontelico
  * Iconic
  * Linearicons Free
  * Linecons
  * Maki
  * Meteocons
  * MfgLabs
  * ModernPictograms
  * Opticons
  * RPGAwesome
  * Typicons
  * WebSymbols
  * Zocial

Please review and respect the copyright information contained in the header file for each font set.

## Usage

Simply import the desired icon set and use the IconData as normal.

```dart
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

final myIcons = const <Widget>[
    const Icon(Typicons.attention),
    const Icon(Fontelico.emo_wink),
    const Icon(Linecons.globe),
];
```

## FlutterIcon

To customize icon packs, visit [FlutterIcon](https://fluttericon.com).


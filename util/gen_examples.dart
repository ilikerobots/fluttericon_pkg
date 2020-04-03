/* Generates examples for fluttericon
 * dart ./gen_examples.dart ../fontconfigs/ ../example/lib/src/icon_lists
 */

import 'package:path/path.dart' as path;
import 'dart:convert';
import 'dart:io';

import 'util.dart';

void main(List<String> arguments) {
  final inDir = Directory(arguments.first);
  final outDir = Directory(arguments[1]);

  if (!inDir.existsSync()) {
    print('Cannot find the file "${arguments.first}".');
  }
  if (!outDir.existsSync()) {
    print('Cannot find the example dir "${arguments[1]}".');
  }

  List dirEntities =
      inDir.listSync(recursive: false, followLinks: false).toList();

  List<String>  iconFamilies = [];

  for (FileSystemEntity entity in dirEntities) {
    if (entity is File && entity.path.endsWith(".json")) {
      Map<String, dynamic> config = json.decode(entity.readAsStringSync());
      String famName = config['name'].toString();
//      String baseName = dartName(famName);
      String iconlistName = dartBaseFilename(famName);
      String dartFileName = dartBaseFilename(famName) + ".dart";
      iconFamilies.add(iconlistName);

      List<dynamic> icons = config['glyphs'];

      List<String> dartContent = [
        '',
        "import 'package:fluttericon/${dartFileName}';",
        "import '../example_icon.dart';",
        '',
        '// NB: DO NOT EDIT! This file is auto-generated. See util/gen_examples.dart',
        '',
        'final ${iconlistName} = <ExampleIcon>[',
      ];

      for (Map<String, dynamic> gDef in icons) {
        String gName = convertGlyphName(gDef['css'].toString());
//        String gCode = convertGlyphCode(gDef['code'].toString());
        dartContent.add('    ExampleIcon($famName.$gName, "$famName", "$gName"),');
      }

      dartContent.add('];');

      File dartFile = new File(path.join(outDir.path, dartFileName));
      dartFile.writeAsStringSync(dartContent.join('\n'));
    }
  }
  File allIconFile = new File(path.join(outDir.path, "all_icons.dart"));

  List<String> dartContent = [
    '',
    "import '../example_icon.dart';",
    "import 'package:fluttericon_example/src/example_icon.dart';",
    '',
    '// NB: DO NOT EDIT! This file is auto-generated. See util/gen_examples.dart',
    '',
  ];
  for (String fName in iconFamilies) {
    dartContent.add("import '${fName}.dart';");
  }
  dartContent.add("");
  dartContent.add("final allIcons = <ExampleIcon>[]");
  for (String fName in iconFamilies) {
    dartContent.add("  ..addAll(${fName})");
  }
  dartContent.add(";");
  allIconFile.writeAsStringSync(dartContent.join('\n'));
}

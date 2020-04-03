import 'package:recase/recase.dart';

final _glyphNameRegex = RegExp(r"[^A-Za-z0-9_]");
const dart_reserved = [
  'abstract',
  'deferred',
  'if',
  'super',
  'as ',
  'do',
  'implements',
  'switch',
  'assert',
  'dynamic',
  'import',
  'sync',
  'async',
  'else',
  'in',
  'this',
  'enum',
  'is',
  'throw',
  'await',
  'export',
  'library',
  'true',
  'break',
  'external',
  'new',
  'try',
  'case',
  'extends',
  'null',
  'typedef',
  'catch',
  'factory',
  'operator',
  'var',
  'class',
  'false',
  'part',
  'void',
  'const',
  'final',
  'rethrow',
  'while',
  'continue',
  'finally',
  'return',
  'with',
  'covariant',
  'for',
  'set',
  'yield',
  'default',
  'get',
  'static',
  'yield'
];

String dartName(String name) => new ReCase(name).snakeCase;

String dartBaseFilename(String name) => dartName(name) + "_icons";

String convertGlyphName(String name) {
  String out = name.replaceAll(_glyphNameRegex, '_');
  for (String r in dart_reserved) {
    if (out == r) {
      out = "${out}_icon";
      break;
    }
  }
  return out;
}

String convertGlyphCode(String code) =>
    "0x" + int.parse(code).toRadixString(16);

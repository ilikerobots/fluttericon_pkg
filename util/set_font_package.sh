#!/usr/bin/env bash
sed -i -- 's/const _kFontPkg = null/const _kFontPkg = "fluttericon"/g' ../lib/*_icons.dart

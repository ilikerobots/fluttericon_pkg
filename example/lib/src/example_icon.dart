import 'package:flutter/widgets.dart';

class ExampleIcon implements Comparable {
  final IconData iconData;
  final String family;
  final String name;

  ExampleIcon(
    this.iconData,
    this.family,
    this.name,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleIcon &&
          runtimeType == other.runtimeType &&
          iconData == other.iconData &&
          family == other.family &&
          name == other.name;

  @override
  int get hashCode => iconData.hashCode ^ family.hashCode ^ name.hashCode;

  @override
  int compareTo(other) {
    if (family == other.family) {
      return name.compareTo(other.name);
    } else {
      return family.compareTo(other.family);
    }
  }
}

import 'package:dark_forest/data/app_enums/statuses.dart';
import 'package:flutter/material.dart';

import '../app_enums/elements.dart';

class Orb {
  final String id;
  final String name;
  final String description;
  final List<Elements> type;
  final Statuses cure;
  final Color color;
  final int turns;

  const Orb({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.color,
    required this.cure,
    required this.turns,
  });
}

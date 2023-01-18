import '../app_enums/elements.dart';
import '../app_enums/statuses.dart';

class Creature {
  final String id;
  final String name;
  final String description;
  final String damageDescription;
  final List<Elements> type;
  final List<Elements> weaknesses;
  final Statuses affliction;
  int damage;
  double defence;
  int hitPoints;
  final statuses = <Statuses>{};

  Creature({
    required this.id,
    required this.name,
    required this.description,
    required this.damage,
    required this.damageDescription,
    required this.affliction,
    required this.weaknesses,
    required this.defence,
    required this.type,
    this.hitPoints = 100,
  });
}

import '../app_enums/elements.dart';
import '../app_enums/statuses.dart';

class Monster {
  final Elements type;
  int attack;
  int defence;
  int hitPoints;
  final statuses = <Afflictions>{};

  Monster({
    required this.attack,
    required this.defence,
    required this.type,
    this.hitPoints = 100,
  });
}

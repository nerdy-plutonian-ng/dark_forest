import 'dart:math';

import 'package:dark_forest/data/creatures.dart';
import 'package:dark_forest/data/models/creature.dart';
import 'package:flutter/foundation.dart';

class CreaturesState with ChangeNotifier {
  late Creature selectedCreature;

  setRandomCreature() {
    selectedCreature = creatures[Random().nextInt(creatures.length)];
    notifyListeners();
  }
}

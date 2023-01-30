import 'package:dark_forest/data/app_enums/statuses.dart';
import 'package:dark_forest/data/models/player.dart';
import 'package:flutter/foundation.dart';

class PlayerState with ChangeNotifier {
  var player = Player();

  takeDamage(int points) {
    player.hitPoints -= points;
    notifyListeners();
  }

  alterStatuses(Afflictions status, bool shouldAdd) {
    shouldAdd ? player.statuses.add(status) : player.statuses.remove(status);
    notifyListeners();
  }

  reset() {
    player = Player();
    notifyListeners();
  }
}

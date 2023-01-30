import 'package:dark_forest/data/models/monster.dart';
import 'package:dark_forest/data/models/orb.dart';
import 'package:dark_forest/data/models/player.dart';
import 'package:flutter/foundation.dart';

class GameState with ChangeNotifier {
  bool isBusy = true;

  setGameBusyState(bool state) {
    isBusy = state;
    notifyListeners();
  }

  final displayTexts = [];

  addDisplayText(String text) {
    displayTexts.add(text);
    notifyListeners();
  }

  Monster? monster;

  setMonster(Monster monster) {
    this.monster = monster;
  }

  Player? player;
  setPlayer(Player player) {
    this.player = player;
  }

  removePlayerStatus(Orb orb) {
    if (player!.statuses.contains(orb.cure)) {
      player!.statuses.remove(orb.cure);
      displayTexts.add('${orb.cure.name} healed!');
    } else {
      displayTexts.add('${orb.name} has no effect.');
    }
    notifyListeners();
  }

  late Set<Orb>? selectedOrbs;

  addOrbs(Set<Orb> selectedOrbs) {
    this.selectedOrbs = selectedOrbs;
  }

  bool isGameOver = false;

  updateGameOver(bool isGameOver) {
    this.isGameOver = isGameOver;
    notifyListeners();
  }

  reset() {
    isBusy = true;
    displayTexts.clear();
    isGameOver = false;
    selectedOrbs = null;
    monster = null;
    player = null;
  }
}

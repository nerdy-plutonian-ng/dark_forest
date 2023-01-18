import 'package:flutter/foundation.dart';

class GameState with ChangeNotifier {
  bool hasGameStarted = false;

  setGameState(bool state) {
    hasGameStarted = state;
    notifyListeners();
  }

  bool isBusy = true;

  setGameBusyState(bool state) {
    isBusy = state;
    notifyListeners();
  }

  final displayTexts = [
    'Let\'s Go!!!',
  ];

  addDisplayText(String text) {
    displayTexts.add(text);
    notifyListeners();
  }
}

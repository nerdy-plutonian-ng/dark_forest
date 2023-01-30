import 'dart:math';

import 'package:dark_forest/data/orbs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/models/orb.dart';

class OrbsState with ChangeNotifier {
  final selectedOrbs = <Orb>[];

  selectOrbs() async {
    _getRandoms().listen((event) {
      selectedOrbs.add(orbs[event]);
      notifyListeners();
    });
  }

  Stream<int> _getRandoms() async* {
    final indices = _generateRandomIndices();
    for (var index in indices) {
      await Future.delayed(const Duration(seconds: 1), () {});
      yield index;
    }
  }

  Set<int> _generateRandomIndices() {
    final indices = <int>{};
    while (indices.length < 1) {
      indices.add(Random().nextInt(orbs.length));
    }
    return indices;
  }

  reset() {
    selectedOrbs.clear();
    notifyListeners();
  }
}

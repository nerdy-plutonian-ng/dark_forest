import 'package:dark_forest/data/app_enums/elements.dart';
import 'package:dark_forest/data/app_enums/statuses.dart';
import 'package:dark_forest/data/models/orb.dart';
import 'package:flutter/material.dart';

const orbs = [
  Orb(
      id: 'O1',
      name: 'Tornado',
      description: 'A violently rotating column of air',
      type: [Elements.wind],
      color: Colors.grey,
      cure: Statuses.none,
      turns: 2),
  Orb(
      id: 'O2',
      name: 'Fire Storm',
      description: 'description',
      type: [Elements.fire],
      color: Colors.red,
      cure: Statuses.none,
      turns: 2),
  Orb(
      id: 'O3',
      name: 'Antidote',
      description: 'A potion to cure poisoning',
      type: [],
      color: Colors.green,
      cure: Statuses.poisoned,
      turns: 1),
];

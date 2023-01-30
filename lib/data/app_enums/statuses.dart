enum Afflictions {
  none(name: 'None', value: 0, shortName: 'NON', turns: 0),
  frozen(name: 'Frozen', value: 0, shortName: 'FZN', turns: 3),
  confused(name: 'Confused', value: 0, shortName: 'CNF', turns: 5),
  burned(name: 'Burned', value: 5, shortName: 'BRN', turns: 3),
  paralyzed(name: 'Paralyzed', value: 0, shortName: 'PRZ', turns: 1),
  poisoned(name: 'Poisoned', value: 5, shortName: 'PSN', turns: 10);

  const Afflictions({
    required this.name,
    required this.shortName,
    required this.value,
    required this.turns,
  });

  final String name;
  final String shortName;
  final int value;
  final int turns;
}

enum Statuses {
  none(name: 'None', value: 0.0, shortName: 'NON'),
  frozen(name: 'Frozen', value: 0.0, shortName: 'FZN'),
  confused(name: 'Confused', value: 0.0, shortName: 'CNF'),
  burned(name: 'Burned', value: 0.1, shortName: 'BRN'),
  poisoned(name: 'Poisoned', value: 0.15, shortName: 'PSN');

  const Statuses({
    required this.name,
    required this.shortName,
    required this.value,
  });

  final String name;
  final String shortName;
  final double value;
}

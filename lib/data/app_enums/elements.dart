enum Elements {
  water(title: 'Water'),
  fire(title: 'Fire'),
  steel(title: 'Steel'),
  ice(title: 'Ice'),
  rock(title: 'Rock'),
  electric(title: 'Electric'),
  wind(title: 'Wind'),
  none(title: 'None');

  const Elements({
    required this.title,
  });
  final String title;
}

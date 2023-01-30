import 'package:dark_forest/data/app_enums/elements.dart';
import 'package:dark_forest/data/app_enums/statuses.dart';

final weaknessChart = <Elements, Set<Elements>>{
  Elements.water: {Elements.ice, Elements.electric},
  Elements.fire: {Elements.water},
  Elements.steel: {Elements.water, Elements.fire, Elements.electric},
  Elements.ice: {Elements.water, Elements.fire},
  Elements.rock: {Elements.water},
  Elements.electric: {},
  Elements.wind: {},
};

final immunityChart = <Elements, Set<Elements>>{
  Elements.water: {
    Elements.fire,
  },
  Elements.fire: {},
  Elements.steel: {},
  Elements.ice: {},
  Elements.rock: {Elements.electric},
  Elements.electric: {},
  Elements.wind: {},
};

final ampChart = <Elements, Set<Elements>>{
  Elements.water: {},
  Elements.fire: {Elements.wind},
  Elements.steel: {},
  Elements.ice: {},
  Elements.rock: {},
  Elements.electric: {Elements.water},
  Elements.wind: {},
};

final afflictionChart = <Elements, Afflictions>{
  Elements.water: Afflictions.none,
  Elements.fire: Afflictions.burned,
  Elements.steel: Afflictions.poisoned,
  Elements.ice: Afflictions.frozen,
  Elements.rock: Afflictions.none,
  Elements.electric: Afflictions.paralyzed,
  Elements.wind: Afflictions.confused,
};

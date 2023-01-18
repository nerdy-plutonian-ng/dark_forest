import 'package:dark_forest/data/app_enums/elements.dart';
import 'package:dark_forest/data/models/creature.dart';

import 'app_enums/statuses.dart';

final creatures = [
  Creature(
    id: 'C1',
    name: 'Ponko Horse',
    description:
        'A ferocious rock horse with large granite fangs. It despises humans and won\'t hesitate to take its pound of flesh. It has a strong aversion to water.',
    type: [Elements.rock],
    weaknesses: [
      Elements.water,
    ],
    affliction: Statuses.none,
    damage: 10,
    defence: 25.0,
    damageDescription: 'Ponko Horse kicks out with diamond hooves!',
  ),
  Creature(
    id: 'C2',
    name: 'Osono Elephant',
    description:
        'Every step shakes the ground violently. It shoots boiling hot water from its trunk. Only the strongest of physical attacks can harm it.',
    damageDescription:
        'Osono Elephant shoots a torrent of boiling hot water at you!',
    damage: 30,
    affliction: Statuses.burned,
    weaknesses: [],
    defence: 50,
    type: [Elements.water],
  ),
  Creature(
    id: 'C3',
    name: 'Fyre Lion',
    description:
        'Muscle, steel claws and a fiery whip for a tail. Strangely it is only weak against fire.',
    damage: 15,
    affliction: Statuses.burned,
    weaknesses: [Elements.fire],
    defence: 30,
    damageDescription:
        'Fyre Lion lassos you with its fiery tail, and swats you with steel claws!',
    type: [Elements.fire, Elements.steel],
  ),
  // Creature(
  //   id: 'C4',
  //   name: 'Snow Eagle',
  //   description:
  //       'This eagle looks regal but you better be careful. A blizzard blows every time it flaps its wings. It can\'t stand steel alone.',
  //   damage: 20,
  //   affliction: Statuses.frozen,
  //   weakness: Elements.fire,
  //   level: Levels.mid,
  // ),
  // Creature(
  //   id: 'C5',
  //   name: 'Kami-Kameleon',
  //   description:
  //       'Hard to see, hard to hit. Its fragile but packs a painful scratch',
  //   damage: 5,
  //   affliction: Statuses.none,
  //   weakness: Elements.all,
  //   level: Levels.low,
  // ),
  // Creature(
  //   id: 'C6',
  //   name: 'Salamander Tres',
  //   description:
  //       'A three headed salamander, if it touches you or tread where its tread, you instantly suffer a burn.',
  //   damage: 15,
  //   affliction: Statuses.burned,
  //   weakness: Elements.all,
  //   level: Levels.mid,
  // ),
  // Creature(
  //   id: 'C7',
  //   name: 'Demon Bat',
  //   description:
  //       'This bat hates light so much it engulfs it’s body in a cloud of smoke which serves as protection. They still make sounds to move around as they’re blind however if the sound bounces off you, you fall instantly into a state of depression.',
  //   damage: 0,
  //   affliction: Statuses.petrified,
  //   weakness: Elements.intangible,
  //   level: Levels.mid,
  // ),
  // Creature(
  //   id: 'C8',
  //   name: 'Lick Frog',
  //   description:
  //       'A minute frog that licks everything. including licking of human skin in one tongue movement. Very resistant to strong attack yet suscepptible to the barest of attacks.',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C9',
  //   name: 'Witch Hawk',
  //   description:
  //       'A teleporting hawk with very sharp gold beak and talons. It is invincible while its beak is intact. Only raging fire can melt it',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C10',
  //   name: 'Gartero Snake',
  //   description:
  //       'A fire and ice resistant small snake that delivers a bite that causes confusion',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C11',
  //   name: 'ReyCobraro Snake',
  //   description:
  //       'A huge soot black snake with red eyes that glow. Just by being within a 1 meter radius of it get you poisoned let alone being sprayed with its venom. It has scales of black diamonds',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C12',
  //   name: 'Acid Worm',
  //   description:
  //       'A fast moving regular looking worm that leaves a fast acting acid trail on whatever it moves on.',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C13',
  //   name: 'Petrifi Cricket',
  //   description:
  //       'A dusty cricket that moves its wings agressively when flying.  Come into contact with the dust and for a short moment you are petrified',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C14',
  //   name: 'Rombo Hegdgehog',
  //   description:
  //       'This hedgehog once it curls up into a ball and starts rolling can not be stopped.  It can shoots its spikes so accurately. Utter silence is its bane',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C15',
  //   name: 'Go-Gorilla',
  //   description:
  //       'Once it gets going, it get going, The largets biceps and fists you will see. The surface area of anything its fists connects with is blasted into smithereens',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C16',
  //   name: 'Water Fox',
  //   description:
  //       'Very slow moving fox, its body is literally drenched fire or dry weather is ineffective against it. It can create a fog that suffocates it victims.',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C17',
  //   name: 'Fighter Panda',
  //   description:
  //       'Fast, agile and hard hitting, this panda can\'t be fought with physical attacks, you wont win.',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C18',
  //   name: 'Tornado Horse',
  //   description:
  //       'A huge powerful bear that conjures tornadoes every time it roars.A paw swipe produces fierce winds that can slice you even if it misses. It suffers from insomnia',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C19',
  //   name: 'Beed Beatle',
  //   description:
  //       'A beetle with absolute defence. And a powerful ramming attack for its size. It however exhausts itself after an attack',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
  // Creature(
  //   id: 'C20',
  //   name: 'Dire Dragonfly',
  //   description:
  //       'The fastest thing you will ever see. Its buzz makes your ears bleed and confused.',
  //   damage: 20,
  //   affliction: Statuses.none,
  //   weakness: Elements.water,
  // ),
];

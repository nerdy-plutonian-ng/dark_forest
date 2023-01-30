import 'dart:math';

import 'package:dark_forest/data/app_enums/elements.dart';
import 'package:dark_forest/data/constants/app_dimensions.dart';
import 'package:dark_forest/data/models/player.dart';
import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/constants/route_paths.dart';
import '../../data/models/monster.dart';

class MonsterCreationScreen extends StatefulWidget {
  const MonsterCreationScreen({Key? key}) : super(key: key);

  @override
  State<MonsterCreationScreen> createState() => _MonsterCreationScreenState();
}

class _MonsterCreationScreenState extends State<MonsterCreationScreen> {
  late Monster monster;

  generateMonster() {
    monster = Monster(
        attack: Random().nextInt(30),
        defence: Random().nextInt(30),
        type: Elements.values[Random().nextInt(Elements.values.length)]);
  }

  @override
  void initState() {
    super.initState();
    generateMonster();
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: appWidth <= AppDimensions.mobileWidth
                  ? 320
                  : AppDimensions.mobileWidth.toDouble(),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'You Will Face',
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'A new monster has been summoned. Check out the stats.',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  SizedBox(
                    width: 128,
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Monster Stats',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(),
                          ),
                          const ListTile(
                            title: Text('HitPoints'),
                            trailing: Text('100'),
                          ),
                          ListTile(
                            title: const Text('Type'),
                            trailing: Text(monster.type.title),
                          ),
                          ListTile(
                            title: const Text('Defence'),
                            trailing: Text(monster.defence.toString()),
                          ),
                          ListTile(
                            title: const Text('Attack'),
                            trailing: Text(monster.attack.toString()),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 8),
                                child: FilledButton(
                                    onPressed: () {
                                      final gameState = Provider.of<GameState>(
                                          context,
                                          listen: false);
                                      gameState.setMonster(monster);
                                      gameState.setPlayer(Player());
                                      gameState.addDisplayText('New Battle!');
                                      context.goNamed(RoutePaths.game);
                                    },
                                    child: const Text('Start Battle')),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

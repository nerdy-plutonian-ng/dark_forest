import 'package:dark_forest/data/cheat_code.dart';
import 'package:dark_forest/data/models/orb.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/app_enums/statuses.dart';
import '../../../domain/app_state/game_state.dart';

class InGameOrbs extends StatelessWidget {
  const InGameOrbs({Key? key, required this.selectedOrbs}) : super(key: key);

  final Set<Orb> selectedOrbs;

  selectOrb(BuildContext context, Orb selectedOrb) async {
    final gameState = Provider.of<GameState>(context, listen: false);
    gameState.setGameBusyState(true);
    gameState.addDisplayText('Player used ${selectedOrb.name}');
    await Future.delayed(const Duration(seconds: 1));
    if (selectedOrb.cure != Afflictions.none) {
      gameState.addDisplayText('Player used ${selectedOrb.name}');
      await Future.delayed(const Duration(seconds: 1));
      gameState.removePlayerStatus(selectedOrb);
    } else {
      var damage = selectedOrb.damage;
      final monsterType = weaknessChart.entries
          .firstWhere((element) => element.key == gameState.monster!.type);
      final isMonsterWeakAgainst = monsterType.value.contains(selectedOrb.type);
      if (isMonsterWeakAgainst) {
        damage += ((30 / 100) * selectedOrb.damage).toInt();
        print('weak against');
      } else {}
    }
    // gameState.updateMonster(
    //     'hitPoints',
    //     (gameState.monster['hitPoints'] as int) -
    //         (selectedOrb['damage'] as int));
    // gameState.updateOrb(
    //     selectedOrbs
    //         .toList()
    //         .indexWhere((element) => element['id'] == selectedOrb['id']),
    //     'turns',
    //     (selectedOrb['turns'] as int) - 1);
    // if ((gameState.monster['hitPoints'] as int) <= 0) {
    //   gameState.updateGameOver(true);
    //   return;
    // }
    // await Future.delayed(const Duration(seconds: 2));
    // gameState.addDisplayText('Monster attacks');
    // await Future.delayed(const Duration(seconds: 1));
    // gameState.updatePlayer(
    //     'hitPoints',
    //     (gameState.player['hitPoints'] as int) -
    //         (gameState.monster['damage'] as int));
    // await Future.delayed(const Duration(seconds: 1));
    // if ((gameState.player['hitPoints'] as int) <= 0) {
    //   gameState.updateGameOver(true);
    //   return;
    // }
    // await Future.delayed(const Duration(seconds: 1));
    // gameState.addDisplayText('What will you do?');
    // gameState.setGameBusyState(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Orbs',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: selectedOrbs
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tooltip(
                      message: e.description,
                      child: FilledButton(
                        onPressed:
                            e.turns == 0 ? null : () => selectOrb(context, e),
                        child: Text('${e.name} (${e.turns}x)'),
                      ),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}

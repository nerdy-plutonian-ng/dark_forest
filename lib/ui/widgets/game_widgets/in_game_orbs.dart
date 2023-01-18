import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/app_state/orbs_state.dart';

class InGameOrbs extends StatelessWidget {
  const InGameOrbs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    return Visibility(
      visible: !gameState.isBusy,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Orbs',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Consumer<OrbsState>(builder: (_, orbs, __) {
            return Wrap(
              children: orbs.selectedOrbs
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(label: Text(e.name)),
                      ))
                  .toList(),
            );
          })
        ],
      ),
    );
  }
}

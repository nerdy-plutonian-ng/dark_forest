import 'package:dark_forest/domain/app_state/creatures_state.dart';
import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:dark_forest/domain/app_state/orbs_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectOrbs extends StatelessWidget {
  const SelectOrbs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orbsState = Provider.of<OrbsState>(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are You Ready?',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              Text(
                orbsState.selectedOrbs.isEmpty
                    ? 'Long press the orb to generate 5 random orbs to help you in your fight.'
                    : 'Click the start button to begin game.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              if (orbsState.selectedOrbs.isEmpty)
                GestureDetector(
                  onLongPress: () {
                    Provider.of<OrbsState>(context, listen: false).selectOrbs();
                  },
                  child: Image.asset(
                    'assets/images/orb.png',
                    width: 128,
                    height: 128,
                  ),
                ),
              Wrap(
                children: orbsState.selectedOrbs
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tooltip(
                            message: e.description,
                            child: Chip(
                              label: Text(e.name),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              if (orbsState.selectedOrbs.length == 3)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<CreaturesState>(context, listen: false)
                            .setRandomCreature();
                        Provider.of<GameState>(context, listen: false)
                            .setGameState(true);
                      },
                      icon: const Icon(Icons.play_circle_outline),
                      label: const Text('Start')),
                )
            ],
          ),
        ),
      ],
    );
  }
}

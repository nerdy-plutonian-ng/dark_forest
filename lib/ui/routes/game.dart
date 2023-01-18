import 'package:dark_forest/data/constants/app_dimensions.dart';
import 'package:dark_forest/domain/app_state/creatures_state.dart';
import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:dark_forest/ui/widgets/game_widgets/display_card.dart';
import 'package:dark_forest/ui/widgets/game_widgets/select_orbs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/game_widgets/creature_card.dart';
import '../widgets/game_widgets/in_game_orbs.dart';
import '../widgets/game_widgets/player_card.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<GameState>(
            builder: (_, gameState, __) {
              return gameState.hasGameStarted
                  ? const Game()
                  : const SelectOrbs();
            },
          ),
        ),
      ),
    );
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final gameState = Provider.of<GameState>(context, listen: false);
      final creatureState = Provider.of<CreaturesState>(context, listen: false);
      gameState.addDisplayText(
          'You are attacked by a ${creatureState.selectedCreature.name}!');
      gameState.setGameBusyState(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        if (appWidth > AppDimensions.mobileWidth)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Stats',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const PlayerCard(),
                const CreatureCard(alignedToStart: true),
              ],
            ),
          ),
        if (appWidth > AppDimensions.mobileWidth)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: VerticalDivider(),
          ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              if (appWidth > AppDimensions.mobileWidth)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Game',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              if (appWidth <= AppDimensions.mobileWidth)
                const SizedBox(
                  height: 16,
                ),
              if (appWidth <= AppDimensions.mobileWidth)
                Row(
                  children: const [
                    Expanded(child: PlayerCard()),
                    Expanded(child: CreatureCard()),
                  ],
                ),
              if (appWidth <= AppDimensions.mobileWidth)
                const SizedBox(
                  height: 16,
                ),
              if (appWidth <= AppDimensions.mobileWidth) const Divider(),
              const SizedBox(
                height: 16,
              ),
              const DisplayCard(),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const InGameOrbs()
            ],
          ),
        ),
      ],
    );
  }
}

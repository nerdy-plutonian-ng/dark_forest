import 'package:dark_forest/data/constants/app_dimensions.dart';
import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:dark_forest/ui/widgets/game_widgets/game_over.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/game_widgets/creature_card.dart';
import '../widgets/game_widgets/display_card.dart';
import '../widgets/game_widgets/in_game_orbs.dart';
import '../widgets/game_widgets/player_card.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  initBattle() async {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      final gameState = Provider.of<GameState>(context, listen: false);
      gameState.addDisplayText('A monster emerges from the darkness enraged!');
      Future.delayed(const Duration(seconds: 3)).then((_) {
        gameState.addDisplayText('What will you do?');
        gameState.setGameBusyState(false);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initBattle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<GameState>(
            builder: (_, gameState, __) {
              final appWidth = MediaQuery.of(context).size.width;
              return gameState.isGameOver
                  ? GameOver(gameState: gameState)
                  : Row(
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
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                PlayerCard(player: gameState.player!),
                                CreatureCard(
                                    alignedToStart: true,
                                    monster: gameState.monster!),
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                if (appWidth <= AppDimensions.mobileWidth)
                                  const SizedBox(
                                    height: 16,
                                  ),
                                if (appWidth <= AppDimensions.mobileWidth)
                                  Row(
                                    children: [
                                      Expanded(
                                          child: PlayerCard(
                                        player: gameState.player!,
                                      )),
                                      Expanded(
                                          child: CreatureCard(
                                        monster: gameState.monster!,
                                      )),
                                    ],
                                  ),
                                if (appWidth <= AppDimensions.mobileWidth)
                                  const SizedBox(
                                    height: 16,
                                  ),
                                if (appWidth <= AppDimensions.mobileWidth)
                                  const Divider(),
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
                                if (!gameState.isBusy)
                                  InGameOrbs(
                                      selectedOrbs: gameState.selectedOrbs!),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

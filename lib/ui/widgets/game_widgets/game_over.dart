import 'package:dark_forest/data/constants/route_paths.dart';
import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key, required this.gameState}) : super(key: key);

  final GameState gameState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Battle Over',
              style: TextStyle(fontFamily: 'HennyPenny', fontSize: 32),
            ),
            Text(
              gameState.player!.hitPoints <= 0
                  ? 'Sorry, you lost!'
                  : 'You won!!!',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              (gameState.player!.hitPoints) <= 0 ? '\u{1F61E}' : '\u{1F973}',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
                onPressed: () {
                  gameState.reset();
                  context.goNamed(RoutePaths.root);
                },
                child: const Text('Ok'))
          ],
        ),
      ),
    );
  }
}

import 'package:dark_forest/domain/app_state/player_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(builder: (_, player, __) {
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('Player'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text('${player.player.hitPoints}/100'),
                )
              ],
            ),
            LinearProgressIndicator(
              value: player.player.hitPoints / 100.0,
            ),
            SizedBox(
              width: 32,
              height: 32,
              child: Wrap(
                children: player.player.statuses
                    .map((e) => FittedBox(
                          child: Chip(
                            label: Text(e.shortName),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      );
    });
  }
}

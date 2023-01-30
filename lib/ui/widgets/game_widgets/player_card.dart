import 'package:dark_forest/data/models/player.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({Key? key, required this.player}) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('Player'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text('${player.hitPoints}/100'),
              )
            ],
          ),
          LinearProgressIndicator(
            value: player.hitPoints / 100.0,
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: Wrap(
              children: player.statuses
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
  }
}

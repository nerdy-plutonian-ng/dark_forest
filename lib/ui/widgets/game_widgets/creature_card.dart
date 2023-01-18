import 'dart:math' as math;

import 'package:dark_forest/domain/app_state/creatures_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatureCard extends StatelessWidget {
  const CreatureCard({Key? key, this.alignedToStart = false}) : super(key: key);

  final bool alignedToStart;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreaturesState>(builder: (_, creature, __) {
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (alignedToStart)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(creature.selectedCreature.name),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('${creature.selectedCreature.hitPoints}/100'),
                ),
                if (!alignedToStart)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(creature.selectedCreature.name),
                  ),
              ],
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: LinearProgressIndicator(
                value: creature.selectedCreature.hitPoints / 100.0,
              ),
            ),
            SizedBox(
              width: 32,
              height: 32,
              child: Wrap(
                children: creature.selectedCreature.statuses
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

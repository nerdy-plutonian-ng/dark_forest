import 'dart:math' as math;

import 'package:dark_forest/data/models/monster.dart';
import 'package:flutter/material.dart';

class CreatureCard extends StatelessWidget {
  const CreatureCard(
      {Key? key, this.alignedToStart = false, required this.monster})
      : super(key: key);

  final bool alignedToStart;
  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (alignedToStart)
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Monster'),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text('${monster.hitPoints}/100'),
              ),
              if (!alignedToStart)
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Monster'),
                ),
            ],
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: LinearProgressIndicator(
              value: monster.hitPoints / 100.0,
            ),
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: Wrap(
              children: monster.statuses
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

import 'package:dark_forest/data/creatures.dart';
import 'package:dark_forest/data/orbs.dart';
import 'package:flutter/material.dart';

class HandbookWidget extends StatelessWidget {
  const HandbookWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Creatures',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.pets,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: creatures.length,
              (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  key: Key(creatures[index].id),
                  child: ListTile(
                    title: Text(creatures[index].name),
                    subtitle: Text(creatures[index].description),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Orbs',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.lightbulb_circle_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: orbs.length,
              (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  key: Key(orbs[index].id),
                  child: ListTile(
                    title: Text(orbs[index].name),
                    subtitle: Text(orbs[index].description),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

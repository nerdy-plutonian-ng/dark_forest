import 'package:dark_forest/data/constants/route_paths.dart';
import 'package:dark_forest/data/models/orb.dart';
import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/constants/app_dimensions.dart';
import '../../data/orbs.dart';

class SelectOrbsScreen extends StatefulWidget {
  const SelectOrbsScreen({Key? key}) : super(key: key);

  @override
  State<SelectOrbsScreen> createState() => _SelectOrbsScreenState();
}

class _SelectOrbsScreenState extends State<SelectOrbsScreen> {
  Set<Orb> selectedOrbs = {};

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: appWidth <= AppDimensions.mobileWidth
                ? 320.0
                : AppDimensions.mobileWidth.toDouble(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Get Ready!!!',
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select 5 orbs to help you on in your battle',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Long press an orb to see what it does',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: orbs
                        .map((e) => Padding(
                              key: Key(e.id),
                              padding: const EdgeInsets.all(4.0),
                              child: Tooltip(
                                message: e.description,
                                child: FilterChip(
                                    selected: selectedOrbs.contains(e),
                                    label: Text(e.name),
                                    onSelected: (isSelected) {
                                      if (isSelected &&
                                          selectedOrbs.length == 5) {
                                        return;
                                      }
                                      setState(() {
                                        if (isSelected) {
                                          selectedOrbs.add(e);
                                        } else {
                                          selectedOrbs.remove(e);
                                        }
                                      });
                                    }),
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: selectedOrbs.length == 5
          ? FloatingActionButton.extended(
              onPressed: () {
                Provider.of<GameState>(context, listen: false)
                    .addOrbs(selectedOrbs);
                context.pushNamed(RoutePaths.monsterCreation);
              },
              label: const Text('Next'),
              icon: const Icon(Icons.navigate_next),
            )
          : null,
    );
  }
}

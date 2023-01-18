import 'package:dark_forest/data/app_navigation.dart';
import 'package:dark_forest/data/constants/app_dimensions.dart';
import 'package:dark_forest/ui/widgets/home_widgets/handbook.dart';
import 'package:dark_forest/ui/widgets/home_widgets/play.dart';
import 'package:dark_forest/ui/widgets/home_widgets/stats.dart';
import 'package:flutter/material.dart';

import '../widgets/home_widgets/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  static const tabs = [
    PlayWidget(),
    HandbookWidget(),
    StatsWidget(),
    SettingsWidget()
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (deviceWidth > AppDimensions.mobileWidth)
              NavigationRail(
                extended: true,
                destinations: appNavigation
                    .map((e) => NavigationRailDestination(
                        icon: Icon(e.iconData), label: Text(e.name)))
                    .toList(),
                selectedIndex: currentIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            Expanded(flex: 2, child: tabs[currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: deviceWidth <= AppDimensions.mobileWidth
          ? BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.onBackground,
              showUnselectedLabels: true,
              items: appNavigation
                  .map((e) => BottomNavigationBarItem(
                        label: e.name,
                        icon: Icon(e.iconData),
                      ))
                  .toList(),
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : null,
    );
  }
}

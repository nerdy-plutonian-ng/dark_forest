import 'package:dark_forest/data/constants/route_paths.dart';
import 'package:dark_forest/ui/routes/game.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.root,
      name: RoutePaths.root,
      builder: (context, routerState) => const HomeScreen(),
      routes: [
        GoRoute(
          path: RoutePaths.game,
          name: RoutePaths.game,
          builder: (_, __) => const GameScreen(),
        )
      ],
    ),
  ],
);

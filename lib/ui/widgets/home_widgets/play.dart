import 'package:dark_forest/data/constants/app_dimensions.dart';
import 'package:dark_forest/data/constants/app_texts.dart';
import 'package:dark_forest/data/constants/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayWidget extends StatelessWidget {
  const PlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: appWidth <= AppDimensions.mobileWidth
              ? 256.0
              : AppDimensions.mobileWidth.toDouble(),
          child: ListView(
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Dark Forest',
                style: TextStyle(
                  fontFamily: 'HennyPenny',
                  fontSize: 64,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                AppTexts.intro,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        context.pushNamed(RoutePaths.game);
                      },
                      icon: const Icon(Icons.play_circle_outline),
                      label: const Text('Play')),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

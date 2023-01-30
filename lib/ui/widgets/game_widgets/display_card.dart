import 'package:dark_forest/data/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/app_state/game_state.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Consumer<GameState>(builder: (_, gameState, __) {
      return Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 128,
            width: appWidth <= AppDimensions.mobileWidth ? 320 : 480,
            child: Center(
              child: Text(
                gameState.displayTexts.last,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            )),
      ));
    });
  }
}

// class TypeText extends StatelessWidget {
//   const TypeText({Key? key, required this.text}) : super(key: key);
//
//   final List<String> text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: DefaultTextStyle(
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 30.0,
//           fontFamily: 'Quicksand',
//         ),
//         child: AnimatedTextKit(
//           isRepeatingAnimation: false,
//           repeatForever: false,
//           animatedTexts: [
//             TypewriterAnimatedText(text, textAlign: TextAlign.center),
//           ],
//         ),
//       ),
//     );
//   }
// }

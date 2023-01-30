import 'package:flutter/material.dart';

showGameOver(BuildContext context, bool isLoss) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Game Over',
                  style: TextStyle(fontFamily: 'HennyPenny', fontSize: 32),
                ),
                Text(
                  isLoss ? 'Sorry, you lost!' : 'You won!!!',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  isLoss ? '\u{1F61E}' : '\u{1F973}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                FilledButton(onPressed: () {}, child: const Text('Ok'))
              ],
            ),
          ),
        );
      });
}

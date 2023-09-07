import 'package:flutter/material.dart';
import 'package:klondike/klondike.dart';

class Restart extends StatelessWidget {
  final KlondikeGame game;
  const Restart({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Constant.purpleTextColor;
            }
            return Constant.whiteTextColor;
          }),
        ),
        child: const Text(
          'Restart',
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () {
          game.startNewGame();
          if (game.hasWon) {
            game.hasWon = false;
            game.overlays.remove('Winning');
            game.overlays.add('Menu');
          }
        },
      ),
    );
  }
}

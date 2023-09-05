import 'package:flutter/material.dart';
import 'package:klondike/klondike_game.dart';

class Restart extends StatelessWidget {
  final KlondikeGame game;
  const Restart({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: TextButton(
          child: const Text(
            'Restart',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            game.startNewGame();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:klondike/klondike_game.dart';

class Restart extends StatelessWidget {
  final KlondikeGame game;
  const Restart({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        child: const Text(
          'Restart',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        onPressed: () {
          game.startNewGame();
        },
      ),
    );
  }
}

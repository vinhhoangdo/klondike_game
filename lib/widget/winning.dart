import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:klondike/klondike_game.dart';

class Winning extends StatefulWidget {
  final KlondikeGame game;
  const Winning({super.key, required this.game});

  @override
  State<Winning> createState() => _WinningState();
}

class _WinningState extends State<Winning> {
  @override
  void initState() {
    FlameAudio.play('win.mp3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF000000).withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'YOU WIN!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  widget.game.startNewGame();
                  widget.game.overlays.remove('Winning');
                  widget.game.overlays.add('Restart');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
